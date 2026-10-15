-- =============================================
-- Özvera Endüstri
-- Factory Management & Production Analytics
-- Production Analysis
-- Data Period: January 2026 - September 2026
-- =============================================

USE OzveraEndustriDB;
GO

-- Total production quantity by product
SELECT
    p.ProductName,
	SUM(pr.QuantityProduced) AS TotalProductionQuantity
FROM ProductionOrders pr
INNER JOIN Products p
   ON p.ProductID = pr.ProductID 
GROUP BY p.ProductName
ORDER BY TotalProductionQuantity DESC;


-- Total production quantity by machine
SELECT
    m.MachineName,
	SUM(pr.QuantityProduced) AS TotalProductionQuantity
FROM ProductionOrders pr
INNER JOIN Machines m
   ON pr.MachineID = m.MachineID
GROUP BY m.MachineName
ORDER BY TotalProductionQuantity DESC;


-- Total production quantity by employee
SELECT
    e.EmployeeName,
	SUM(pr.QuantityProduced) AS TotalProductionQuantity
FROM ProductionOrders pr
INNER JOIN Employees e
   ON pr.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeName
ORDER BY TotalProductionQuantity DESC;


-- Average production quantity by product
SELECT
    p.ProductName,
	AVG(pr.QuantityProduced) AS AverageProductionQuantity
FROM ProductionOrders pr
INNER JOIN Products p
   ON p.ProductID = pr.ProductID 
GROUP BY p.ProductName
ORDER BY AverageProductionQuantity DESC;


-- Average production quantity by machine
SELECT
    m.MachineName,
	AVG(pr.QuantityProduced) AS AverageProductionQuantity
FROM ProductionOrders pr
INNER JOIN Machines m
   ON pr.MachineID = m.MachineID
GROUP BY m.MachineName
ORDER BY AverageProductionQuantity DESC;


-- Product with the highest production quantity
SELECT TOP 1
    p.ProductName,
	SUM(pr.QuantityProduced) AS TotalProductionQuantity
FROM ProductionOrders pr
INNER JOIN Products p
   ON p.ProductID = pr.ProductID 
GROUP BY p.ProductName
ORDER BY TotalProductionQuantity DESC;


-- Machine with the highest production quantity
SELECT TOP 1
    m.MachineName,
	SUM(pr.QuantityProduced) AS TotalProductionQuantity
FROM ProductionOrders pr
INNER JOIN Machines m
   ON pr.MachineID = m.MachineID
GROUP BY m.MachineName
ORDER BY TotalProductionQuantity DESC;


-- Monthly production quantity
SELECT
    YEAR(pr.ProductionDate) AS ProductionYear,
	MONTH(pr.ProductionDate) AS ProductionMonth,
	SUM(pr.QuantityProduced) AS TotalProductionQuantity
FROM ProductionOrders pr
GROUP BY 
    YEAR(pr.ProductionDate),
	MONTH(pr.ProductionDate)
ORDER BY 
    YEAR(pr.ProductionDate),
	MONTH(pr.ProductionDate);

-- Top 5 products by production quantity
SELECT TOP 5 
    p.ProductName,
	SUM(pr.QuantityProduced) AS TotalProductionQuantity
FROM ProductionOrders pr
INNER JOIN Products p
   ON p.ProductID = pr.ProductID 
GROUP BY p.ProductName
ORDER BY TotalProductionQuantity DESC;


-- Machines with total production quantity greater than 2500
SELECT
    m.MachineName,
	SUM(pr.QuantityProduced) AS TotalProductionQuantity
FROM ProductionOrders pr
INNER JOIN Machines m
   ON pr.MachineID = m.MachineID
GROUP BY m.MachineName
HAVING SUM(pr.QuantityProduced) > 2500
ORDER BY TotalProductionQuantity DESC;


