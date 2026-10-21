-- Which products sell the most?
SELECT
    product,
    SUM(quantity) AS units_sold,
    ROUND(SUM(quantity * unitPrice), 2) AS revenue_usd
FROM samples.bakehouse.sales_transactions
GROUP BY product
ORDER BY revenue_usd DESC;


-- Compare total revenue and transaction volume by country
SELECT
    fran.country,
    ROUND(SUM(tran.quantity * tran.unitPrice), 2) AS total_revenue_usd,
    COUNT(*) AS transaction_line_count,
    SUM(tran.quantity) AS units_sold
FROM samples.bakehouse.sales_transactions AS tran
INNER JOIN samples.bakehouse.sales_franchises AS fran
    ON tran.franchiseID = fran.franchiseID
GROUP BY fran.country
ORDER BY total_revenue_usd DESC;


-- Which cities generate the highest averages revenue?
SELECT
    country,
    city,
    ROUND(AVG(quantity * unitPrice), 2) AS avg_revenue_usd
FROM samples.bakehouse.sales_transactions tran
INNER JOIN samples.bakehouse.sales_franchises fran
    ON tran.franchiseID = fran.franchiseID
GROUP BY country, city
ORDER BY avg_revenue_usd DESC;


-- Highest average line-item revenue by city within each country
WITH ranked_cities AS (
    SELECT 
            fran.city,
            fran.country,
            ROUND(AVG(quantity * unitPrice), 2) AS avg_revenue_usd,
            ROW_NUMBER() OVER (PARTITION BY fran.country ORDER BY ROUND(AVG(quantity * unitPrice), 2) DESC) as rn
    FROM samples.bakehouse.sales_transactions tran
    INNER JOIN samples.bakehouse.sales_franchises fran
        ON tran.franchiseID = fran.franchiseID
    GROUP BY fran.city, fran.country
)
SELECT 
    country,
    city,
    avg_revenue_usd
FROM ranked_cities
WHERE rn = 1
ORDER BY avg_revenue_usd DESC;


-- Sentiment review analysis
WITH review_sentiments AS (
    SELECT
        ai_query(
            'databricks-llama-4-maverick',
            'Classify this review as positive, negative, or neutral. '
            || 'Return only one label. Review: '
            || COALESCE(review, '')
        ) AS sentiment
    FROM samples.bakehouse.media_customer_reviews
),
total_reviews AS (
    SELECT COUNT(*) AS total_count
    FROM samples.bakehouse.media_customer_reviews
),
cleaned_sentiments AS (
    SELECT
        LOWER(
            TRIM(
                REGEXP_REPLACE(TRIM(sentiment), '\\.+$', '')
            )
        ) AS sentiment
    FROM review_sentiments
)
SELECT
    cs.sentiment,
    COUNT(*) AS review_count,
    ROUND(
        COUNT(*) * 100.0 / NULLIF(MAX(tr.total_count), 0),
        2
    ) AS review_percentage
FROM cleaned_sentiments cs
CROSS JOIN total_reviews tr
GROUP BY cs.sentiment
ORDER BY review_count DESC;
