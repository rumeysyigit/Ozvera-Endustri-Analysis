-- =============================================
-- Özvera Endüstri
-- Factory Management & Production Analytics
-- Quality Analysis
-- Data Period: January 2026 - September 2026
-- =============================================

USE OzveraEndustriDB;
GO

-- Total inspected quantity by product
SELECT
   p.ProductName,
   SUM(q.InspectedQuantity) AS TotalInspectedQuantity 
FROM QualityControl q 
INNER JOIN ProductionOrders pr
   ON q.ProductionID = pr.ProductionID
INNER JOIN Products p
   ON pr.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalInspectedQuantity DESC;


-- Total defective quantity by product
SELECT
   p.ProductName,
   SUM(q.DefectiveQuantity) AS TotalDefectiveQuantity
FROM QualityControl q
INNER JOIN ProductionOrders pr
   ON q.ProductionID = pr.ProductionID
INNER JOIN Products p 
   ON pr.ProductID = p.ProductID		
GROUP BY p.ProductName
ORDER BY TotalDefectiveQuantity DESC;


-- Defect rate by product
SELECT
   p.ProductName,
   CAST(SUM(q.DefectiveQuantity) AS DECIMAL(10,4))
        / SUM(q.InspectedQuantity) AS DefectRate
FROM QualityControl q 
INNER JOIN ProductionOrders pr
   ON q.ProductionID = pr.ProductionID
INNER JOIN Products p
   ON pr.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY DefectRate DESC;


-- Total defective quantity by defect reason
SELECT
    q.DefectReason,
	SUM(q.DefectiveQuantity) AS TotalDefectiveQuantity
FROM QualityControl q
GROUP BY q.DefectReason
ORDER BY TotalDefectiveQuantity DESC;


-- Total inspections by defect reason
SELECT
    q.DefectReason,
	COUNT(q.InspectedQuantity) AS TotalInspections
FROM QualityControl q
GROUP BY q.DefectReason
ORDER BY TotalInspections DESC;


-- Product with the highest defective quantity
SELECT TOP 1
   p.ProductName,
   SUM(q.DefectiveQuantity) AS TotalDefectiveQuantity
FROM QualityControl q
INNER JOIN ProductionOrders pr
   ON q.ProductionID = pr.ProductionID
INNER JOIN Products p
   ON pr.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalDefectiveQuantity DESC;


-- Defect reason with the highest defective quantity
SELECT TOP 1
   q.DefectReason,
   SUM(q.DefectiveQuantity) AS TotalDefectiveQuantity
FROM QualityControl q
GROUP BY q.DefectReason
ORDER BY TotalDefectiveQuantity DESC;


-- Monthly defective quantity
SELECT
   YEAR(q.InspectionDate) AS InspectionYear,
   MONTH(q.InspectionDate) AS InspectionMonth,
   SUM(q.DefectiveQuantity) AS TotalDefectiveQuantity
FROM QualityControl q
GROUP BY 
   YEAR(q.InspectionDate), 
   MONTH(q.InspectionDate)
ORDER BY 
   YEAR(q.InspectionDate), 
   MONTH(q.InspectionDate)


-- Top 5 products by defective quantity
SELECT TOP 5
   p.ProductName,
   SUM(Q.DefectiveQuantity) AS TotalDefectiveQuantity
FROM QualityControl q
INNER JOIN ProductionOrders pr
   ON q.ProductionID = pr.ProductionID
INNER JOIN Products p
   ON pr.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalDefectiveQuantity DESC;


-- Products with more than 50 defective units
SELECT 
   p.ProductName,
   SUM(Q.DefectiveQuantity) AS TotalDefectiveQuantity
FROM QualityControl q
INNER JOIN ProductionOrders pr
   ON q.ProductionID = pr.ProductionID
INNER JOIN Products p
   ON pr.ProductID = p.ProductID
GROUP BY p.ProductName
HAVING SUM(Q.DefectiveQuantity) > 50
ORDER BY TotalDefectiveQuantity DESC;

