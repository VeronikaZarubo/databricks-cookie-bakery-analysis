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