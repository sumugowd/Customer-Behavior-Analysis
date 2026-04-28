-- Customer Behavior Analysis

-- 1. Total Revenue
SELECT ROUND(SUM(Revenue), 2) AS total_revenue
FROM customers;

-- 2. Top 10 Customers
SELECT CustomerID, ROUND(SUM(Revenue), 2) AS total_spent
FROM customers
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;

--3. Repeat Customers
SELECT CustomerID, COUNT(DISTINCT InvoiceNo) AS total_orders
FROM customers
GROUP BY CustomerID
HAVING total_orders > 1;

--4. New Customers (Single Purchase)
SELECT CustomerID
FROM customers
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceNo) = 1;

--5. Average Order Value (AOV)
SELECT
    ROUND(SUM(Revenue) / COUNT(DISTINCT InvoiceNo), 2) AS avg_order_value
FROM customers;

--6. Monthly Revenue Trend
SELECT
    strftime('%Y-%m', InvoiceDate) AS month,
    ROUND(SUM(Revenue), 2) AS revenue
FROM customers
GROUP BY month
ORDER BY month;

--7. Revenue by Country
SELECT Country, ROUND(SUM(Revenue), 2) AS total_revenue
FROM customers
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 10;

--8. Most Sold Products
SELECT Description, SUM(Quantity) AS total_sold
FROM customers
GROUP BY Description
ORDER BY total_sold DESC
LIMIT 10;

--9. Customer Lifetime Value (CLTV)
SELECT CustomerID, ROUND(SUM(Revenue), 2) AS lifetime_value
FROM customers
GROUP BY CustomerID
ORDER BY lifetime_value DESC;

--10. Orders Per Customer
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS total_orders
FROM customers
GROUP BY CustomerID
ORDER BY total_orders DESC;