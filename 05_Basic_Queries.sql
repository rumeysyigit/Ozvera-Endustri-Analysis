-- =============================================
-- Özvera Endüstri
-- Factory Management & Production Analytics
-- Basic Queries
-- Data Period: January 2026 - September 2026
-- =============================================

USE OzveraEndustriDB;
GO

-- =============================================
-- Basic Queries
-- =============================================

-- List all products
SELECT * 
FROM Products;

-- List all customers
SELECT * 
FROM Customers;

-- List all orders
SELECT * 
FROM Orders;

-- List all production targets
SELECT *
FROM ProductionTargets;

-- List all machine downtime records
SELECT *
FROM MachineDowntime;

-- List all quality control records
SELECT *
FROM QualityControl;

-- List all production orders
SELECT *
FROM ProductionOrders;


-- List products with a unit cost greater than 500
SELECT * 
FROM Products
WHERE UnitCost > 500;


-- List customers located in Bursa
SELECT * 
FROM Customers
WHERE City = 'Bursa';


-- List orders with a quantity greater than 100
SELECT * 
FROM Orders
WHERE Quantity > 100;


-- List production targets greater than 300 units
SELECT *
FROM ProductionTargets
WHERE TargetQuantity > 300;


-- List downtime records longer than 100 minutes
SELECT *
FROM MachineDowntime
WHERE DowntimeMinutes > 100;


-- List quality inspections with more than 5 defective units
SELECT *
FROM QualityControl
WHERE DefectiveQuantity > 5;


-- List production records with more than 400 units produced
SELECT *
FROM ProductionOrders
WHERE QuantityProduced > 400;



-- Sort products by unit price from lowest to highest
SELECT * 
FROM Products
ORDER BY UnitPrice ASC;


-- Sort products by unit price from highest to lowest
SELECT * 
FROM Products
ORDER BY UnitPrice DESC;


-- Sort customers alphabetically by customer name
SELECT * 
FROM Customers
ORDER BY CustomerName ASC;


-- Sort production targets from highest to lowest
SELECT *
FROM ProductionTargets
ORDER BY TargetQuantity DESC;


-- Sort downtime records from longest to shortest
SELECT *
FROM MachineDowntime
ORDER BY DowntimeMinutes DESC;


-- Sort quality inspections by defective quantity
SELECT *
FROM QualityControl
ORDER BY DefectiveQuantity DESC;


-- Sort production records from highest to lowest quantity
SELECT *
FROM ProductionOrders
ORDER BY QuantityProduced DESC;


-- Count the total number of products
SELECT COUNT(*) AS TotalProducts
FROM Products;


-- Count the total number of customers
SELECT COUNT(*) AS TotalCustomers
FROM Customers;


-- Count the total number of orders
SELECT COUNT(*) AS TotalOrders
FROM Orders;

-- Count the total number of production targets
SELECT COUNT(*) AS TotalProductionTargets
FROM ProductionTargets;


-- Count the total number of downtime records
SELECT COUNT(*) AS TotalDowntimeRecords
FROM MachineDowntime;


-- Count the total number of quality inspections
SELECT COUNT(*) AS TotalQualityInspections
FROM QualityControl;


-- Count the total number of production orders
SELECT COUNT(*) AS TotalProductionOrders
FROM ProductionOrders;


-- Calculate the average unit price of products
SELECT AVG(UnitPrice) AS AverageUnitPrice
FROM Products;


-- Calculate the average order quantity
SELECT AVG(Quantity) AS AverageOrderQuantity
FROM Orders;


-- Calculate the average production target
SELECT AVG(TargetQuantity) AS AverageTargetQuantity
FROM ProductionTargets;


-- Calculate the average downtime
SELECT AVG(DowntimeMinutes) AS AverageDowntime
FROM MachineDowntime;


-- Calculate the average inspected quantity
SELECT AVG(InspectedQuantity) AS AverageInspectedQuantity
FROM QualityControl;


-- Calculate the total quantity ordered
SELECT SUM(Quantity) AS TotalOrderQuantity
FROM Orders;


-- Calculate the total quantity produced
SELECT SUM(QuantityProduced) AS TotalProductionQuantity
FROM ProductionOrders;


-- Calculate the total production target
SELECT SUM(TargetQuantity) AS TotalTargetQuantity
FROM ProductionTargets;


-- Calculate the total downtime
SELECT SUM(DowntimeMinutes) AS TotalDowntime
FROM MachineDowntime;


-- Calculate the total inspected quantity
SELECT SUM(InspectedQuantity) AS TotalInspectedQuantity
FROM QualityControl;


-- Calculate the total defective quantity
SELECT SUM(DefectiveQuantity) AS TotalDefectiveQuantity
FROM QualityControl;


-- Calculate the total production quantity
SELECT SUM(QuantityProduced) AS TotalProductionQuantity
FROM ProductionOrders;


-- Find the highest unit price
SELECT MAX(UnitPrice) AS MaxUnitPrice
FROM Products;


-- Find the highest order quantity
SELECT MAX(Quantity) AS MaxOrderQuantity
FROM Orders;


-- Find the highest production target
SELECT MAX(TargetQuantity) AS MaxTargetQuantity
FROM ProductionTargets;


-- Find the longest downtime
SELECT MAX(DowntimeMinutes) AS MaxDowntime
FROM MachineDowntime;


-- Find the highest defective quantity
SELECT MAX(DefectiveQuantity) AS MaxDefectiveQuantity
FROM QualityControl;


-- Find the highest production quantity
SELECT MAX(QuantityProduced) AS MaxProductionQuantity
FROM ProductionOrders;


-- Find the lowest unit price
SELECT MIN(UnitPrice) AS MinUnitPrice
FROM Products;


-- Find the lowest order quantity
SELECT MIN(Quantity) AS MinOrderQuantity
FROM Orders;


-- Find the lowest production target
SELECT MIN(TargetQuantity) AS MinTargetQuantity
FROM ProductionTargets;


-- Find the shortest downtime
SELECT MIN(DowntimeMinutes) AS MinDowntime
FROM MachineDowntime;


-- Find the lowest defective quantity
SELECT MIN(DefectiveQuantity) AS MinDefectiveQuantity
FROM QualityControl;


-- Find the lowest production quantity
SELECT MIN(QuantityProduced) AS MinProductionQuantity
FROM ProductionOrders;


-- Count the number of products in each category
SELECT Category, COUNT(*) AS ProductCount
FROM Products
GROUP BY Category;


-- Count the number of customers in each city
SELECT City, COUNT(*) AS CustomerCount
FROM Customers
GROUP BY City;


-- Count the number of employees in each department
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;


-- List products with a unit price between 300 and 1000
SELECT * 
FROM Products
WHERE UnitPrice BETWEEN 300 AND 1000;


-- List orders placed in January 2026
SELECT * 
FROM Orders
WHERE OrderDate BETWEEN '2026-01-01' AND '2026-01-31';


-- List production targets between 250 and 400 units
SELECT *
FROM ProductionTargets
WHERE TargetQuantity BETWEEN 250 AND 400;


-- List downtime records between 50 and 100 minutes
SELECT *
FROM MachineDowntime
WHERE DowntimeMinutes BETWEEN 50 AND 100;


-- List quality inspections with defective quantities between 2 and 5 units
SELECT *
FROM QualityControl
WHERE DefectiveQuantity BETWEEN 2 AND 5;


-- List production records with quantities between 300 and 500 units
SELECT *
FROM ProductionOrders
WHERE QuantityProduced BETWEEN 300 AND 500;


-- Sort products by category and product name
SELECT * 
FROM Products
ORDER BY Category, ProductName ASC;


-- List orders with a quantity of 100 or more
-- Sort the results by quantity from lowest to highest
SELECT * 
FROM Orders
WHERE Quantity >= 100
ORDER BY Quantity ASC;


-- Count the number of customers in each city
SELECT City,
       COUNT(*) AS CustomerCount
FROM Customers
GROUP BY City
ORDER BY CustomerCount DESC;


-- Count downtime records by reason
SELECT Reason,
       COUNT(*) AS DowntimeCount
FROM MachineDowntime
GROUP BY Reason
ORDER BY DowntimeCount DESC;


-- Count quality inspections by defect reason
SELECT DefectReason,
       COUNT(*) AS InspectionCount
FROM QualityControl
GROUP BY DefectReason
ORDER BY InspectionCount DESC;




