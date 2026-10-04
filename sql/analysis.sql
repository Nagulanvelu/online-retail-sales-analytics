-- Online Retail Sales Analytics
-- MySQL 8+
-- Expected table: online_retail

-- 1. Overall KPIs
SELECT
    ROUND(SUM(Revenue), 2) AS total_revenue,
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    COUNT(DISTINCT CustomerID) AS unique_customers,
    SUM(Quantity) AS units_sold
FROM online_retail;

-- 2. Monthly revenue trend
SELECT
    YearMonth,
    ROUND(SUM(Revenue), 2) AS revenue
FROM online_retail
GROUP BY YearMonth
ORDER BY YearMonth;

-- 3. Top 10 products by revenue
SELECT
    Description,
    ROUND(SUM(Revenue), 2) AS revenue
FROM online_retail
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;

-- 4. Top 10 products by quantity
SELECT
    Description,
    SUM(Quantity) AS units_sold
FROM online_retail
GROUP BY Description
ORDER BY units_sold DESC
LIMIT 10;

-- 5. Revenue by country
SELECT
    Country,
    ROUND(SUM(Revenue), 2) AS revenue
FROM online_retail
GROUP BY Country
ORDER BY revenue DESC;

-- 6. Top 10 customers by revenue
SELECT
    CustomerID,
    ROUND(SUM(Revenue), 2) AS revenue,
    COUNT(DISTINCT InvoiceNo) AS orders
FROM online_retail
GROUP BY CustomerID
ORDER BY revenue DESC
LIMIT 10;

-- 7. Average order value
SELECT
    ROUND(SUM(Revenue) / COUNT(DISTINCT InvoiceNo), 2) AS average_order_value
FROM online_retail;

-- 8. Revenue by year
SELECT
    Year,
    ROUND(SUM(Revenue), 2) AS revenue
FROM online_retail
GROUP BY Year
ORDER BY Year;

-- 9. Monthly orders
SELECT
    YearMonth,
    COUNT(DISTINCT InvoiceNo) AS orders
FROM online_retail
GROUP BY YearMonth
ORDER BY YearMonth;

-- 10. Country order volume
SELECT
    Country,
    COUNT(DISTINCT InvoiceNo) AS orders
FROM online_retail
GROUP BY Country
ORDER BY orders DESC;
