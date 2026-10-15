-- =============================================
-- Özvera Endüstri
-- Factory Management & Production Analytics
-- Joins and Relationships
-- Data Period: January 2026 - September 2026
-- =============================================

USE OzveraEndustriDB;
GO

-- =============================================
-- INNER JOIN Queries
-- =============================================

-- List orders together with customer names
SELECT 
    o.OrderID,
    c.CustomerName,
    o.OrderDate,
    o.Quantity
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID;


-- List orders together with product names
SELECT 
    o.OrderID ,
	p.ProductName,
	o.OrderDate,
	o.Quantity
FROM Orders o
INNER JOIN Products p
    ON o.ProductID = p.ProductID;


-- List orders with customer and product information
SELECT 
    o.OrderID,
    c.CustomerName,
    p.ProductName,
    o.OrderDate,
    o.Quantity
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID
INNER JOIN Products p
    ON o.ProductID = p.ProductID;


-- List production records together with machine names
SELECT
    p.ProductionID,
	m.MachineName,
	P.ProductionDate,
	p.QuantityProduced
FROM ProductionOrders p
INNER JOIN Machines m 
    ON p.MachineID = m.MachineID;


-- List production records together with product names
SELECT
    p.ProductionID,
	pr.ProductName,
	p.ProductionDate,
	p.QuantityProduced
FROM ProductionOrders p 
INNER JOIN Products pr
    ON p.ProductID = pr.ProductID;


-- List production records together with employee names
SELECT
    p.ProductionID,
	e.EmployeeName,
	p.ProductionDate,
	p.QuantityProduced
FROM ProductionOrders p
INNER JOIN Employees e
    ON p.EmployeeID = e.EmployeeID


-- =============================================
-- LEFT JOIN Queries
-- =============================================

-- List customers who have not placed any orders
SELECT 
    c.CustomerID,
    c.CustomerName
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;


-- List all machines and their downtime records
SELECT 
    m.MachineName,
    d.DowntimeDate,
    d.DowntimeMinutes,
    d.Reason
FROM Machines m
LEFT JOIN MachineDowntime d
    ON m.MachineID = d.MachineID;


-- =============================================
-- RIGHT JOIN Query
-- =============================================

-- List all customers and their orders using a RIGHT JOIN
SELECT 
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.Quantity
FROM Orders o
RIGHT JOIN Customers c
    ON o.CustomerID = c.CustomerID;


-- =============================================
-- FULL OUTER JOIN Query
-- =============================================

-- Compare customers and orders using a FULL OUTER JOIN
SELECT 
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate,
    o.Quantity
FROM Customers c
FULL OUTER JOIN Orders o
    ON c.CustomerID = o.CustomerID;


-- =============================================
-- JOIN with Aggregation
-- =============================================

SELECT 
    c.CustomerName,
    SUM(o.Quantity) AS TotalOrderQuantity
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalOrderQuantity DESC;


-- Calculate total ordered quantity for each product
SELECT 
    p.ProductName,
    SUM(o.Quantity) AS TotalOrderQuantity
FROM Products p
INNER JOIN Orders o
    ON p.ProductID = o.ProductID
GROUP BY p.ProductName
ORDER BY TotalOrderQuantity DESC;


-- Calculate total production quantity for each machine
-- Sort machines from highest to lowest production quantity
SELECT 
    m.MachineName,
    SUM(p.QuantityProduced) AS TotalQuantityProduced
FROM Machines m
INNER JOIN ProductionOrders p
    ON m.MachineID = p.MachineID
GROUP BY m.MachineName
ORDER BY TotalQuantityProduced DESC;

