-- =============================================
-- Özvera Endüstri
-- Factory Management & Production Analytics
-- Table Creation
-- Data Period: January 2026 - September 2026
-- =============================================

USE OzveraEndustriDB;
GO


-- =============================================
-- Products Table
-- =============================================

CREATE TABLE Products (
    ProductID INT NOT NULL PRIMARY KEY,
    ProductName VARCHAR(50) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    UnitCost DECIMAL(10,2) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL
);


-- =============================================
-- Customers Table
-- =============================================

CREATE TABLE Customers (
    CustomerID INT NOT NULL PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL
);


-- =============================================
-- Employees Table
-- =============================================

CREATE TABLE Employees (
    EmployeeID INT NOT NULL PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL
);


-- =============================================
-- Machines Table
-- =============================================

CREATE TABLE Machines (
    MachineID INT NOT NULL PRIMARY KEY,
    MachineName VARCHAR(50) NOT NULL,
    MachineType VARCHAR(50) NOT NULL
);


-- =============================================
-- Orders Table
-- =============================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);


-- =============================================
-- Production Orders Table
-- =============================================

CREATE TABLE ProductionOrders (
    ProductionID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    MachineID INT NOT NULL,
    EmployeeID INT NOT NULL,
    ProductionDate DATE NOT NULL,
    QuantityProduced INT NOT NULL,

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID),

    FOREIGN KEY (MachineID)
        REFERENCES Machines(MachineID),

    FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);


-- =============================================
-- Production Targets Table
-- =============================================

CREATE TABLE ProductionTargets (
    TargetID INT PRIMARY KEY,
    ProductionID INT NOT NULL,
    TargetDate DATE NOT NULL,
    TargetQuantity INT NOT NULL

	FOREIGN KEY (ProductionID)
        REFERENCES ProductionOrders(ProductionID)
);


-- =============================================
-- Machine Downtime Table
-- =============================================

CREATE TABLE MachineDowntime (
    DowntimeID INT PRIMARY KEY,
    MachineID INT NOT NULL,
    DowntimeDate DATE NOT NULL,
    DowntimeMinutes INT NOT NULL,
    Reason VARCHAR(50) NOT NULL

	FOREIGN KEY (MachineID)
        REFERENCES Machines(MachineID)
);


-- =============================================
-- Quality Control Table
-- =============================================

CREATE TABLE QualityControl (
    QualityID INT PRIMARY KEY,
    ProductionID INT NOT NULL,
    InspectionDate DATE NOT NULL,
    InspectedQuantity INT NOT NULL,
    DefectiveQuantity INT NOT NULL,
    DefectReason VARCHAR(50) NOT NULL

	FOREIGN KEY (ProductionID)
        REFERENCES ProductionOrders(ProductionID)
);





