# Databricks Cookie Bakery Analysis

## Project Overview

This project explores sales data from the simulated Bakehouse dataset available in Databricks Free Edition. It uses SQL to analyze product performance, compare revenue across countries, and identify cities with the highest average line-item revenue.

The project is inspired by Noah Sommerfeld's tutorial, *3 Free Databricks Analytics Projects You Can Do In An Afternoon*, and focuses on developing practical SQL skills through business-oriented questions.

**Project status:** SQL analysis in progress. Dashboard and report creation are planned.

## Objectives

- Identify the best-selling products by units sold and revenue.
- Compare total revenue, sales volume, and transaction line counts across countries.
- Analyze average line-item revenue by city.
- Identify the highest-average-revenue city within each country.
- Prepare the analysis for a future dashboard and business report.

## Tools and Technologies

- **Databricks Free Edition** — data exploration and SQL execution.
- **Databricks SQL** — aggregations, joins, sorting, and window functions.
- **GitHub** — version control and project documentation.
- **AI/BI Dashboards** — planned for visualizing the analysis.

## Dataset

The project uses sample data available in the Databricks `samples.bakehouse` schema.

| Table | Purpose |
|---|---|
| `sales_transactions` | Product, quantity, unit price, and franchise identifier data. |
| `sales_franchises` | Franchise location information, including city and country. |

The analysis uses the existing Databricks sample dataset; no separate dataset upload is required.

## Business Questions

### 1. Which products sell the most?

The first query groups sales by product and calculates:

- **Units sold:** total quantity sold per product.
- **Revenue:** total quantity multiplied by unit price.

Products are sorted by revenue in descending order to identify the highest-revenue products.

### 2. Which countries generate the most revenue?

The second query joins sales transactions with franchise locations and aggregates results by country.

Metrics include:

- **Total revenue:** sum of quantity multiplied by unit price.
- **Transaction line count:** number of sales rows in the dataset for each country.
- **Units sold:** total quantity sold.

This comparison helps identify countries with the highest total sales revenue and provides additional context about sales volume.

*Note: The line count represents rows in the transaction table, not necessarily distinct transactions.*

### 3. Which cities have the highest average line-item revenue?

The third query groups sales by country and city and calculates average line-item revenue using:

`AVG(quantity * unitPrice)`

The results are sorted in descending order to highlight cities with the highest average line-item values.

This metric represents average revenue per sales row, not necessarily average revenue per complete customer transaction.

### 4. Which city ranks highest within each country?

The fourth query uses a common table expression (CTE) and the `ROW_NUMBER()` window function to rank cities within each country by average line-item revenue.

Only the top-ranked city in each country is returned.

This makes it possible to compare the highest-average-revenue city across different countries.

## SQL Analysis

The SQL queries are maintained in:

`sql/analysis_queries.sql`

The analysis demonstrates the following SQL techniques:

- Aggregation using `SUM()`, `AVG()`, and `COUNT()`.
- Revenue calculations and numeric rounding.
- Inner joins between sales and location tables.
- Grouping and sorting results.
- Common table expressions (CTEs).
- Window functions using `ROW_NUMBER()` and `PARTITION BY`.

## Planned Deliverables

The following work is planned and has not yet been marked as completed.

- [ ] Execute and validate all SQL queries.
- [ ] Record verified findings and business insights.
- [ ] Build a Databricks AI/BI dashboard with key sales metrics.
- [ ] Add visualizations for product revenue and sales by country.
- [ ] Compare average line-item revenue across cities.
- [ ] Capture dashboard screenshots and add them to the repository.
- [ ] Create a written business report summarizing the findings and recommendations.

## Planned Dashboard

The dashboard is intended to provide a visual overview of bakery sales performance.

Potential components include:

- KPI cards for total revenue, units sold, and sales line count.
- A bar chart showing revenue by product.
- A country-level comparison of revenue and units sold.
- A city-level comparison of average line-item revenue.
- A ranked view of the highest-average-revenue city in each country.

The final dashboard design will depend on the results and the most useful business insights identified during analysis.

## Planned Business Report

Once the queries have been validated, a business report will summarize:

1. The strongest-performing products.
2. Revenue distribution across countries.
3. Differences in average line-item revenue across cities.
4. The highest-ranked city within each country.
5. Potential business implications and recommendations supported by the results.

No findings or recommendations are reported here yet; these will be added after the analysis has been executed and reviewed.

## How to Reproduce the Analysis

1. Create or access a Databricks Free Edition workspace.
2. Open Catalog Explorer and locate the `samples.bakehouse` schema.
3. Open the SQL editor.
4. Run the queries from `sql/analysis_queries.sql`.
5. Review the output and verify the calculations.
6. Document the findings before creating the planned dashboard and business report.

## Learning Outcomes

This project provides practical experience with:

- SQL-based business analysis.
- Sales revenue and product performance metrics.
- Joining transactional data with geographic information.
- Aggregation and ranking techniques.
- Git-based project organization and documentation.
- Preparing analytical results for business reporting and visualization.

## References

- [Databricks Free Edition](https://www.databricks.com/product/free-edition)
- [Databricks Documentation](https://docs.databricks.com/)
- Noah Sommerfeld, *3 Free Databricks Analytics Projects You Can Do In An Afternoon*.

---

**Current status:** SQL query development and project documentation. Dashboard creation and business report preparation are planned next.
