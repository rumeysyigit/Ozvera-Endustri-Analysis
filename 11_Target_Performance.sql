-- =============================================
-- Özvera Endüstri
-- Factory Management & Production Analytics
-- Target Performance
-- Data Period: January 2026 - September 2026
-- =============================================

USE OzveraEndustriDB;
GO


-- Actual vs Target Production by Production ID
SELECT
   pr.ProductionID,
   SUM(pr.QuantityProduced) AS TotalActualProduction ,
   SUM(pt.TargetQuantity) AS TotalTargetProduction
FROM ProductionOrders pr
INNER JOIN ProductionTargets pt
   ON pr.ProductionID = pt.ProductionID
GROUP BY pr.ProductionID
ORDER BY pr.ProductionID 


-- Total Actual vs Target Production
SELECT
   SUM(pr.QuantityProduced) AS TotalActualProduction ,
   SUM(pt.TargetQuantity) AS TotalTargetProduction
FROM ProductionOrders pr
INNER JOIN ProductionTargets pt
   ON pr.ProductionID = pt.ProductionID

-- Target Achievement by Production ID
SELECT
   pr.ProductionID,
   CAST(SUM(pr.QuantityProduced) AS DECIMAL(10,4))
        / SUM(pt.TargetQuantity) AS TargetAchievement
FROM ProductionOrders pr
INNER JOIN ProductionTargets pt
   ON pr.ProductionID = pt.ProductionID
GROUP BY pr.ProductionID
ORDER BY pr.ProductionID 


-- Production Variance by Production ID
SELECT
   pr.ProductionID,
   SUM(pr.QuantityProduced) - SUM(pt.TargetQuantity) AS ProductionVariance
FROM ProductionOrders pr
INNER JOIN ProductionTargets pt
   ON pr.ProductionID = pt.ProductionID
GROUP BY pr.ProductionID
ORDER BY pr.ProductionID 


-- Monthly Actual vs Target Production
SELECT
   YEAR(pr.ProductionDate) AS ProductionYear,
   MONTH(pr.ProductionDate) AS ProductionMonth,
   SUM(pr.QuantityProduced) AS TotalActualProduction ,
   SUM(pt.TargetQuantity) AS TotalTargetProduction
FROM ProductionOrders pr
INNER JOIN ProductionTargets pt
   ON pr.ProductionID = pt.ProductionID
GROUP BY 
   YEAR(pr.ProductionDate),
   MONTH(pr.ProductionDate) 
ORDER BY 
   YEAR(pr.ProductionDate),
   MONTH(pr.ProductionDate) 


-- Actual vs Target Production by Product
SELECT
   p.ProductName,
   SUM(pr.QuantityProduced) AS TotalActualProduction,
   SUM(pt.TargetQuantity) AS TotalTargetProduction
FROM ProductionOrders pr
INNER JOIN ProductionTargets pt
   ON pr.ProductionID = pt.ProductionID
INNER JOIN Products p
   ON pr.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY p.ProductName;


-- Actual vs Target Production by Machine
SELECT
   m.MachineName,
   SUM(pr.QuantityProduced) AS TotalActualProduction,
   SUM(pt.TargetQuantity) AS TotalTargetProduction
FROM ProductionOrders pr
INNER JOIN ProductionTargets pt
   ON pr.ProductionID = pt.ProductionID
INNER JOIN Machines m
   ON pr.MachineID = m.MachineID
GROUP BY m.MachineName
ORDER BY m.MachineName;

-- Product with the Highest Production Variance
SELECT TOP 1
   p.ProductName,
   SUM(pr.QuantityProduced) - SUM(pt.TargetQuantity) AS TotalProductionVariance 
FROM ProductionOrders pr
INNER JOIN ProductionTargets pt
   ON pr.ProductionID = pt.ProductionID
INNER JOIN Products p
   ON pr.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalProductionVariance DESC;

-- Top 5 Products by Target Achievement
SELECT TOP 5
   p.ProductName,
   CAST(SUM(pr.QuantityProduced) AS DECIMAL(10,4))
        / SUM(pt.TargetQuantity) AS TargetAchievement
FROM ProductionOrders pr
INNER JOIN ProductionTargets pt
   ON pr.ProductionID = pt.ProductionID
INNER JOIN Products p
   ON pr.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TargetAchievement DESC;


-- Products with Production Below Target
SELECT 
    p.ProductName,
    SUM(pr.QuantityProduced) AS TotalActualProduction,
    SUM(pt.TargetQuantity) AS TotalTargetProduction
FROM ProductionOrders pr
INNER JOIN ProductionTargets pt
    ON pr.ProductionID = pt.ProductionID
INNER JOIN Products p
    ON pr.ProductID = p.ProductID
GROUP BY p.ProductName
HAVING SUM(pr.QuantityProduced) < SUM(pt.TargetQuantity)
ORDER BY TotalActualProduction DESC;



