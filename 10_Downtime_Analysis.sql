-- =============================================
-- Özvera Endüstri
-- Factory Management & Production Analytics
-- Downtime Analysis
-- Data Period: January 2026 - September 2026
-- =============================================

USE OzveraEndustriDB;
GO


--Total downtime by machine
SELECT
   m.MachineName,
   SUM(md.DowntimeMinutes) AS TotalDowntimeMinutes
FROM MachineDowntime md
INNER JOIN Machines m
   ON md.MachineID = m.MachineID
GROUP BY m.MachineName
ORDER BY TotalDowntimeMinutes DESC;


--Average downtime by machine
SELECT
    m.MachineName,
	AVG(md.DowntimeMinutes) AS AverageDowntimeMinute
FROM MachineDowntime md
INNER JOIN Machines m
   ON md.MachineID = m.MachineID
GROUP BY m.MachineName
ORDER BY AverageDowntimeMinute DESC;


--Total downtime by reason
SELECT
    md.Reason,
	SUM(md.DowntimeMinutes) AS TotalDowntimeMinute
FROM MachineDowntime md
GROUP BY md.Reason
ORDER BY TotalDowntimeMinute DESC;


--Number of downtime records by machine
SELECT
    m.MachineName,
	COUNT(md.DowntimeID) AS TotalDowntimeRecords
FROM MachineDowntime md
INNER JOIN Machines m
   ON md.MachineID = m.MachineID
GROUP BY m.MachineName
ORDER BY TotalDowntimeRecords DESC;


--Number of downtime records by reason
SELECT
    md.Reason,
	COUNT(md.DowntimeID) AS TotalDowntimeRecords
FROM MachineDowntime md
GROUP BY md.Reason
ORDER BY TotalDowntimeRecords DESC;


--Machine with the highest downtime
SELECT TOP 1
   m.MachineName,
   SUM(md.DowntimeMinutes) AS TotalDowntimeMinutes
FROM MachineDowntime md
INNER JOIN Machines m
   ON md.MachineID = m.MachineID
GROUP BY m.MachineName
ORDER BY TotalDowntimeMinutes DESC;


--Reason with the highest downtime
SELECT TOP 1
    md.Reason,
	SUM(md.DowntimeMinutes) AS TotalDowntimeMinute
FROM MachineDowntime md
GROUP BY md.Reason
ORDER BY TotalDowntimeMinute DESC;


--Monthly downtime
SELECT 
    YEAR(md.DowntimeDate) AS DowntimeMinuteYear,
	MONTH(md.DowntimeDate) AS DowntimeMinuteMounth,
	SUM(md.DowntimeMinutes) AS TotalDowntimeMinute
FROM MachineDowntime md
GROUP BY 
    YEAR(md.DowntimeDate),
	MONTH(md.DowntimeDate)
ORDER BY
    YEAR(md.DowntimeDate),
	MONTH(md.DowntimeDate);


--Top 5 machines by downtime
SELECT TOP 5
   m.MachineName,
   SUM(md.DowntimeMinutes) AS TotalDowntimeMinutes
FROM MachineDowntime md
INNER JOIN Machines m
   ON md.MachineID = m.MachineID
GROUP BY m.MachineName
ORDER BY TotalDowntimeMinutes DESC;


--Machines with more than 500 downtime minutes
SELECT 
   m.MachineName,
   SUM(md.DowntimeMinutes) AS TotalDowntimeMinutes
FROM MachineDowntime md
INNER JOIN Machines m
   ON md.MachineID = m.MachineID
GROUP BY m.MachineName
HAVING SUM(md.DowntimeMinutes) > 500
ORDER BY TotalDowntimeMinutes DESC;




