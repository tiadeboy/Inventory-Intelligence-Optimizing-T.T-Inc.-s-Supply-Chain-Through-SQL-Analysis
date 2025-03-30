-- a) Total number of units sold per product SKU
SELECT 
    productid, 
    SUM(inventoryquantity) AS "Total Units Sold"
FROM sales
GROUP BY productid
ORDER BY "Total Units Sold" DESC;

----------------------------------------------------------------------------------------------------------------

-- b) Product category with the highest sales volume last month
SELECT p.productcategory, SUM(s.inventoryquantity) AS "Total Sales Volume"
FROM sales s
JOIN product p ON s.productid = p.productid
WHERE s.sales_year = '2021' AND s.sales_month = '11'
GROUP BY p.productcategory
ORDER BY "Total Sales Volume" DESC
LIMIT 1;

----------------------------------------------------------------------------------------------------------------

-- c) Correlation between inflation rate and sales volume for a specific month
SELECT s.sales_month, s.sales_year, AVG(f.inflationrate) AS "Average Inflation",
SUM(s.inventoryquantity) AS "Sales Volume"
FROM sales s
JOIN factors f ON s.salesdate = f.salesdate
GROUP BY s.sales_year, s.sales_month;

----------------------------------------------------------------------------------------------------------------

-- d) Correlation between inflation rate and sales quantity (monthly, last year)
SELECT s.sales_year, s.sales_month, AVG(f.inflationrate) AS Average_Inflation,
SUM(s.inventoryquantity) AS Total_Sales_Quantity
FROM sales s
JOIN factors f ON f.salesdate = s.salesdate
WHERE s.salesdate >= (CURRENT_DATE - INTERVAL '1 year')
GROUP BY s.sales_year, s.sales_month
ORDER BY s.sales_year, s.sales_month;

----------------------------------------------------------------------------------------------------------------

-- e) Impact of promotions on sales quantity
SELECT p.productcategory, ROUND(AVG(s.inventoryquantity)) AS "Average Sales Without Promotion", p.promotions
FROM sales s
JOIN product p ON p.productid = s.productid
WHERE p.promotions = 'No'
GROUP BY p.productcategory, p.promotions

UNION ALL

SELECT p.productcategory, ROUND(AVG(s.inventoryquantity)) AS "Average Sales With Promotion", p.promotions
FROM sales s
JOIN product p ON p.productid = s.productid
WHERE p.promotions = 'Yes'
GROUP BY p.productcategory, p.promotions;

----------------------------------------------------------------------------------------------------------------

-- f) Average sales quantity per product category
SELECT 
    p.productcategory, 
    ROUND(AVG(s.inventoryquantity)) AS "Average Sales Quantity"
FROM sales s
JOIN product p ON s.productid = p.productid
GROUP BY p.productcategory
ORDER BY "Average Sales Quantity" DESC;

----------------------------------------------------------------------------------------------------------------

-- g) Effect of GDP on total sales volume
SELECT s.sales_year, SUM(f.gdp) AS "Total GDP",
SUM(s.inventoryquantity) AS "Total Sales"
FROM sales s
JOIN factors f ON f.salesdate = s.salesdate
GROUP by s.sales_year
ORDER BY "Total Sales" DESC;
----------------------------------------------------------------------------------------------------------------

-- h) Top 10 best-selling product SKUs
SELECT 
    productid, 
    SUM(inventoryquantity) AS "Total Units Sold"
FROM sales
GROUP BY productid
ORDER BY "Total Units Sold" DESC
LIMIT 10;

----------------------------------------------------------------------------------------------------------------

-- i) Influence of seasonal factors on sales quantities by product category
SELECT 
    p.productcategory, ROUND(AVG(f.seasonalfactor),5) AS "Average Seasonal Factor",
    SUM(s.inventoryquantity) AS "Total Sales"
FROM sales s
JOIN product p ON s.productid = p.productid
JOIN factors f ON s.salesdate = f.salesdate
GROUP BY p.productcategory
ORDER BY "Average Seasonal Factor";

----------------------------------------------------------------------------------------------------------------

-- j) Average sales quantity per product category and products under promotion
SELECT p.productcategory, 
    AVG(s.inventoryquantity) AS "Avg Sales Quantity",
    COUNT(CASE WHEN p.promotions = 'Yes' THEN 1 END) AS "Promoted products"
FROM sales s
JOIN product p ON s.productid = p.productid
GROUP BY p.productcategory
ORDER BY "Promoted products" DESC;
