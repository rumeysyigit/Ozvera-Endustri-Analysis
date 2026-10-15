-- =============================================
-- Özvera Endüstri
-- Factory Management & Production Analytics
-- Data Validation
-- Data Period: January 2026 - September 2026
-- =============================================

USE OzveraEndustriDB;
GO

-- =============================================
-- Record Count Validation
-- =============================================

SELECT 'Orders' AS TableName, COUNT(*) AS RecordCount
FROM Orders

UNION ALL

SELECT 'ProductionOrders', COUNT(*)
FROM ProductionOrders

UNION ALL

SELECT 'ProductionTargets', COUNT(*)
FROM ProductionTargets

UNION ALL

SELECT 'MachineDowntime', COUNT(*)
FROM MachineDowntime

UNION ALL

SELECT 'QualityControl', COUNT(*)
FROM QualityControl;

-- =============================================
-- NULL Value Validation
-- =============================================

SELECT
    'Orders' AS TableName,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS NullCustomerID,
    SUM(CASE WHEN ProductID IS NULL THEN 1 ELSE 0 END) AS NullProductID,
    SUM(CASE WHEN OrderDate IS NULL THEN 1 ELSE 0 END) AS NullOrderDate,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS NullQuantity
FROM Orders

UNION ALL

SELECT
    'ProductionOrders',
    SUM(CASE WHEN ProductID IS NULL THEN 1 ELSE 0 END),
    SUM(CASE WHEN MachineID IS NULL THEN 1 ELSE 0 END),
    SUM(CASE WHEN ProductionDate IS NULL THEN 1 ELSE 0 END),
    SUM(CASE WHEN QuantityProduced IS NULL THEN 1 ELSE 0 END)
FROM ProductionOrders;

-- =============================================
-- Date Range Validation
-- =============================================

SELECT
    'Orders' AS TableName,
    MIN(OrderDate) AS MinDate,
    MAX(OrderDate) AS MaxDate
FROM Orders

UNION ALL

SELECT
    'ProductionOrders',
    MIN(ProductionDate),
    MAX(ProductionDate)
FROM ProductionOrders

UNION ALL

SELECT
    'ProductionTargets',
    MIN(TargetDate),
    MAX(TargetDate)
FROM ProductionTargets

UNION ALL

SELECT
    'MachineDowntime',
    MIN(DowntimeDate),
    MAX(DowntimeDate)
FROM MachineDowntime

UNION ALL

SELECT
    'QualityControl',
    MIN(InspectionDate),
    MAX(InspectionDate)
FROM QualityControl;

-- =============================================
-- Referential Integrity Validation
-- =============================================

-- Check for invalid CustomerID values in Orders
SELECT
    o.OrderID,
    o.CustomerID
FROM Orders o
LEFT JOIN Customers c
    ON o.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;


-- Check for invalid ProductID values in Orders
SELECT
    o.OrderID,
    o.ProductID
FROM Orders o
LEFT JOIN Products p
    ON o.ProductID = p.ProductID
WHERE p.ProductID IS NULL;


-- Check for invalid ProductID values in ProductionOrders
SELECT
    po.ProductionID,
    po.ProductID
FROM ProductionOrders po
LEFT JOIN Products p
    ON po.ProductID = p.ProductID
WHERE p.ProductID IS NULL;

-- =============================================
-- Referential Integrity Validation - Production
-- =============================================

-- Check for invalid MachineID values
SELECT
    po.ProductionID,
    po.MachineID
FROM ProductionOrders po
LEFT JOIN Machines m
    ON po.MachineID = m.MachineID
WHERE m.MachineID IS NULL;


-- Check for invalid EmployeeID values
SELECT
    po.ProductionID,
    po.EmployeeID
FROM ProductionOrders po
LEFT JOIN Employees e
    ON po.EmployeeID = e.EmployeeID
WHERE e.EmployeeID IS NULL;


-- Check for invalid MachineID values in MachineDowntime
SELECT
    md.DowntimeID,
    md.MachineID
FROM MachineDowntime md
LEFT JOIN Machines m
    ON md.MachineID = m.MachineID
WHERE m.MachineID IS NULL;


-- Check for invalid ProductionID values in QualityControl
SELECT
    qc.QualityID,
    qc.ProductionID
FROM QualityControl qc
LEFT JOIN ProductionOrders po
    ON qc.ProductionID = po.ProductionID
WHERE po.ProductionID IS NULL;


-- Check for invalid ProductionID values in ProductionTargets
SELECT
    pt.TargetID,
    pt.ProductionID
FROM ProductionTargets pt
LEFT JOIN ProductionOrders po
    ON pt.ProductionID = po.ProductionID
WHERE po.ProductionID IS NULL;