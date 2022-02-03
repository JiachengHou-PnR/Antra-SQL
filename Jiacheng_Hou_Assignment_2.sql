-- Antra Inc
-- .NET Full Stack Developer 
-- Jan Batch 2022
-- Assignment 2
-- Instructor: Rebecca Liu
-- Author: Jiacheng Hou
-- Feb 2, 2022

USE AdventureWorks2019
GO

-- Q1
SELECT COUNT(*) ProductCount
FROM Production.Product

--Q2
SELECT COUNT(*) ProductCount
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL

--Q3
SELECT ProductSubcategoryID, COUNT(*) CountedProducts 
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID

--Q4
SELECT COUNT(*) ProductCount
FROM Production.Product
WHERE ProductSubcategoryID IS NULL

--Q5
SELECT SUM(Quantity) TotalQuantity
FROM Production.ProductInventory

--Q6
SELECT ProductID, SUM(Quantity) TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(Quantity) < 100

--Q7--
SELECT Shelf, ProductID, SUM(Quantity) TheSum
FROM Production.ProductInventory
GROUP BY ProductID, Shelf
HAVING SUM(Quantity) < 100

--Q8
SELECT ProductID, AVG(Quantity) TheAvg
FROM Production.ProductInventory
WHERE LocationID = 10
GROUP BY ProductID

--Q9
SELECT ProductID, Shelf, AVG(Quantity) TheAvg
FROM Production.ProductInventory
GROUP BY ProductID, Shelf

--Q10
SELECT ProductID, Shelf, AVG(Quantity) TheAvg
FROM Production.ProductInventory
WHERE Shelf != 'N/A'
GROUP BY ProductID, Shelf

--Q11
SELECT Color, Class, COUNT(*) TheCount, AVG(ListPrice) TheAvg
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class

--Joins
--Q12
SELECT cr.Name Country, sp.Name Province
FROM person.CountryRegion cr 
INNER JOIN person.StateProvince sp
ON cr.CountryRegionCode = sp.CountryRegionCode

--Q13
SELECT cr.Name Country, sp.Name Province
FROM person.CountryRegion cr 
INNER JOIN person.StateProvince sp
ON cr.CountryRegionCode = sp.CountryRegionCode
WHERE cr.Name IN ('Germany', 'Canada')

--Using Northwind Database
USE Northwind
GO

--Q14
SELECT DISTINCT p.ProductID, p.ProductName
FROM [Order Details] od
INNER JOIN Products p
ON p.ProductID = od.ProductID
INNER JOIN Orders o
ON od.OrderID = o.OrderID
WHERE YEAR(GETDATE()) - YEAR(o.OrderDate) <=25

--Q15
SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) ProductsSold
FROM Orders o
INNER JOIN [Order Details] od
ON od.OrderID = o.OrderID
WHERE o.ShipPostalCode IS NOT NULL
GROUP BY o.ShipPostalCode
ORDER BY ProductsSold DESC

--Q16
SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) ProductsSold
FROM Orders o
INNER JOIN [Order Details] od
ON od.OrderID = o.OrderID
WHERE o.ShipPostalCode IS NOT NULL
AND YEAR(GETDATE()) - YEAR(o.OrderDate) <=25
GROUP BY o.ShipPostalCode
ORDER BY ProductsSold DESC

--Q17
SELECT c.City, COUNT(*) NumOfCustomers
FROM Customers c
GROUP BY c.City

--Q18
SELECT c.City, COUNT(*) NumOfCustomers
FROM Customers c
GROUP BY c.City
HAVING COUNT(*) > 2

--Q19
SELECT c.CompanyName, o.OrderDate
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '19980101' 

--Q20
SELECT c.CompanyName
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderDate IN (
    SELECT TOP 1 d.OrderDate OrderDate
    FROM Orders d
    ORDER BY d.OrderDate DESC
)

--Q21
SELECT c.CompanyName, SUM(od.Quantity) AS TotalQuantity
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
LEFT JOIN [Order Details] od
ON o.OrderID = od.OrderID
GROUP BY c.CompanyName

--Q22
SELECT c.CompanyName, SUM(od.Quantity) AS TotalQuantity
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
LEFT JOIN [Order Details] od
ON o.OrderID = od.OrderID
GROUP BY c.CompanyName
HAVING SUM(Quantity) > 100

--Q23
SELECT su.CompanyName [Supplier Company Name], sh.CompanyName [Shipping Company Name]
FROM Suppliers su
CROSS JOIN Shippers sh

--Q24


--Q25
SELECT e1.FirstName + ' ' + e1.LastName AS [Name 1], e2.FirstName + ' ' + e2.LastName AS [Name 2], e1.Title
FROM Employees e1
INNER JOIN Employees e2
ON e1.Title = e2.Title
WHERE e1.FirstName != e2.FirstName AND e1.LastName != e2.LastName

--Q26
SELECT m.FirstName + ' '+ m.LastName as Manager
FROM Employees m
INNER JOIN Employees e
ON m.EmployeeID = e.ReportsTo
GROUP BY m.FirstName, m.LastName
HAVING COUNT(*) > 2

--Q27
SELECT c.City, c.CompanyName, c.ContactName, 'Customer' Type
FROM Customers c
UNION
SELECT s.City, s.CompanyName, s.ContactName, 'Supplier' Type
FROM Suppliers s