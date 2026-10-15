-- =============================================
-- Özvera Endüstri
-- Factory Management & Production Analytics
-- Sales Analysis
-- Data Period: January 2026 - September 2026
-- =============================================

USE OzveraEndustriDB;
GO


-- =============================================
-- Sales Analysis Queries
-- =============================================


-- Total order quantity by product
SELECT
    p.ProductName,
    SUM(o.Quantity) AS TotalOrderQuantity
FROM Orders o
INNER JOIN Products p 
    ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalOrderQuantity DESC;


-- Total order quantity by customer
SELECT
    c.CustomerName,
	SUM(o.Quantity) AS TotalOrderQuantity
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalOrderQuantity DESC; 


-- Total order quantity by category
SELECT
    p.Category,
	SUM(o.Quantity) AS TotalOrderQuantity
FROM Orders o
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalOrderQuantity DESC; 


-- Total orders by customer
SELECT
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrder
FROM Orders o 
INNER JOIN Customers c 
   ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalOrder DESC;


-- Average order quantity by product
SELECT
    p.ProductName,
	AVG(o.Quantity) AS AverageOrderQuantity 
FROM Orders o
INNER JOIN Products p
   ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY AverageOrderQuantity DESC;


-- Product with the highest order quantity
SELECT TOP 1 
    p.ProductName,
	SUM(o.Quantity) AS TotalOrderQuantity
FROM Orders o
INNER JOIN Products p
   ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalOrderQuantity DESC;


-- Customer with the highest order quantity
SELECT TOP 1
    c.CustomerName,
	Sum(o.Quantity) AS TotalOrderQuantity
FROM Orders o
INNER JOIN Customers c 
   ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalOrderQuantity DESC;


-- Monthly order quantity
SELECT 
    YEAR(o.OrderDate) AS OrderYear,
	MONTH(o.OrderDate) AS OrderMounth,
	SUM(o.Quantity) AS TotalOrderQuantity
FROM Orders o
GROUP BY 
    YEAR(o.OrderDate),
	MONTH(o.OrderDate)
ORDER BY 
    YEAR(o.OrderDate),
	MONTH(o.OrderDate);


-- Top 5 products by order quantity
SELECT TOP 5
    p.ProductName,
	SUM(O.Quantity) AS TotalOrderQuantity
FROM Orders o
INNER JOIN Products p
   ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalOrderQuantity DESC;


-- Customers with a total order quantity greater than 1000
SELECT
    c.CustomerName,
    SUM(o.Quantity) AS TotalOrderQuantity
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
HAVING SUM(o.Quantity) > 1000
ORDER BY TotalOrderQuantity DESC;



