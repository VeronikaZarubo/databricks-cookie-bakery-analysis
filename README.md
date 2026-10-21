# Databricks Cookie Bakery Analysis

## About the Project

This project explores sales and customer review data from the Databricks Bakehouse sample dataset. I used SQL in Databricks to analyse product sales, revenue across different locations and customer review sentiment. I also built a Power BI dashboard to present the results visually.

The goal was to practise working with data in Databricks, use AI to classify customer feedback and turn the results into something useful for business decision-making.

## Tools Used

- **Databricks SQL** — querying and analysing the sample data
- **Databricks AI Functions** — using `ai_query()` to classify customer reviews
- **Power BI** — building an interactive dashboard
- **GitHub** — version control and project documentation

## What I Worked On

### 1. Sales Analysis

Using the Bakehouse sales data, I explored:

- Best-selling products and revenue by product
- Revenue and sales activity by country
- Average sales line-item revenue by city
- The city with the highest average line-item revenue in each country

These queries helped me practise aggregations, joins, common table expressions (CTEs) and window functions in SQL.

### 2. Customer Review Sentiment Analysis

I used Databricks' `ai_query()` function with the `databricks-llama-4-maverick` model to classify customer reviews as positive, negative or neutral.

I then grouped the results to calculate review counts and percentages. I also worked on cleaning the model output so labels with extra punctuation would not be counted as separate categories.

AI-generated classifications can be imperfect, so the results should be checked before using them to make business decisions.

### 3. Power BI Dashboard

I built a Power BI dashboard to make the analysis easier to explore and understand.

The dashboard brings the results into a visual format, making it easier to compare sales performance across products and locations and review the customer sentiment breakdown.

## Repository Structure

```text
databricks-cookie-bakery-analysis/
├── README.md
└── report/
    └── bakehouse_sales_report.pdf
└── sql/
    └── analysis_queries.sql
```

## How to Explore the Project

1. Open the SQL file to review the queries used for the analysis.
2. Run the queries in Databricks with access to the `samples.bakehouse` tables.
3. Explore the Power BI dashboard to see the results visually.

The SQL queries use Databricks' sample Bakehouse data, so access to the relevant sample tables and AI model is required to reproduce the analysis.

## What I Learned

Through this project, I practised writing SQL for business analysis, joining datasets, ranking results with window functions, using AI functions for sentiment classification, cleaning model output and presenting findings in Power BI.

## Reference

This project was inspired by Noah Sommerfeld's Databricks tutorial, *3 Free Databricks Analytics Projects You Can Do In An Afternoon*.
