# Inventory-Intelligence-Optimizing-T.T-Inc.-s-Supply-Chain-Through-SQL-Analysis
This repository contains SQL scripts and analysis related to optimizing inventory management for T.T. Inc., a consumer electronics company. The project utilizes PostgreSQL and pgAdmin 4 to extract actionable insights from sales, product, and economic data.

## Project Overview

The primary objective is to provide data-driven recommendations for the upcoming supply chain strategy meeting. This involves:

* Minimizing overstock and understock situations.
* Understanding seasonal trends in sales for different products.
* Improving customer satisfaction by ensuring product availability.

## Datasets

The analysis is based on three datasets:

* **Sales Data:** Contains information about sales transactions, including product IDs, sales dates, quantities, and costs.
* **Product Information Data:** Details product categories and promotion indicators.
* **External Information Data:** Provides economic data like GDP, inflation rates, and seasonal factors.

## Tools Used

* **PostgreSQL:** Database management system for storing and querying data.
* **pgAdmin 4:** PostgreSQL administration and development platform.
* **SQL (Structured Query Language):** For data extraction and analysis.

## SQL Queries and Insights

The following SQL queries were executed to extract valuable insights:

1.  **Total Units Sold per Product SKU:** Calculates the total number of units sold for each product.
2.  **Product Category with Highest Sales Volume (Last Month):** Identifies the product category with the highest sales volume in the previous month.
3.  **Correlation Between Inflation Rate and Sales Volume:** Analyzes the relationship between inflation and sales.
4.  **Correlation Between Inflation Rate and Sales Quantity (Monthly, Last Year):** Examines the monthly correlation between inflation and sales quantity over the past year.
5.  **Impact of Promotions on Sales Quantity:** Determines how promotions affect sales.
6.  **Average Sales Quantity per Product Category:** Calculates the average sales quantity for each category.
7.  **Effect of GDP on Total Sales Volume:** Analyzes the relationship between GDP and sales.
8.  **Top 10 Best-Selling Product SKUs:** Identifies the top 10 best-selling products.
9.  **Influence of Seasonal Factors on Sales:** Examines how seasonal factors affect sales.
10. **Average Sales Quantity per Category and Promotion Count:** Calculates average sales and counts promoted products per category.

## Screenshots

The following screenshots illustrate the pgAdmin 4 environment and the SQL queries:

* **[Image 1 - Initial Queries]:** Shows the first set of queries analyzing sales and product data.
* **[Image 2 - Promotion and Economic Queries]:** Displays queries focusing on promotion impact and economic factors.
* **[Image 3 - Top Products and Seasonal Analysis]:** Presents queries related to top products, seasonal impacts, and category promotion counts, including the data output.

## Usage

To replicate this analysis:

1.  Install PostgreSQL and pgAdmin 4.
2.  Create a database named "SUPPLY".
3.  Restore the provided database backup into PostgreSQL.
4.  Execute the SQL queries provided in the repository.

## Contribution

Contributions to this project are welcome. Feel free to submit pull requests or open issues for suggestions and improvements.
