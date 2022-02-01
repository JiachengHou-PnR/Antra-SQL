-- Antra Inc
-- .NET Full Stack Developer 
-- Jan Batch 2022
-- Instructor: Rebecca Liu
-- Author: Jiacheng Hou
-- Feb 1, 2022

USE AdventureWorks2019
GO

-- Q1.1
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product

--Q1.2
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product
WHERE ListPrice != 0

--Q1.3
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product
WHERE Color IS NULL

--Q1.4
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL

--Q1.5
SELECT ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL AND ListPrice > 0

--Q1.6
SELECT Name + Color AS "Q1.6"
FROM Production.Product
WHERE Color IS NOT NULL

--Q1.7
SELECT 'NAME: ' + Name + ' -- ' + 'COLOR: ' + Color AS "Q1.7"
FROM Production.Product
WHERE Name LIKE '%Crankarm' OR Name LIKE 'Chainring%'
ORDER BY ProductID

--Q1.8
SELECT ProductID, Name
FROM Production.Product
WHERE ProductID BETWEEN 400 AND 500

--Q1.9
SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color IN ('Black', 'Blue')

--Q1.10
SELECT *
FROM Production.Product
WHERE Name LIKE 'S%'

--Q1.11
SELECT Name, ListPrice
FROM Production.Product
WHERE Name LIKE 'S%'
ORDER BY Name

--Q1.12
SELECT Name, ListPrice
FROM Production.Product
WHERE Name LIKE '[AS]%' 
ORDER BY Name

--Q1.13
SELECT *
FROM Production.Product
WHERE Name LIKE 'SPO[^K]%'
ORDER BY Name

--Q1.14
SELECT DISTINCT  Color
FROM Production.Product
WHERE Color IS NOT NULL
ORDER BY Color DESC

--Q1.15
SELECT DISTINCT ProductSubcategoryID, Color
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL AND Color IS NOT NULL
