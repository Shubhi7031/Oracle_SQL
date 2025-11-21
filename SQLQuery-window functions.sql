USE SalesDB

--Write a query to assign a row number to each employee sorted by salary (highest first)

SELECT 
	EmployeeID,
	FirstName,
	Salary,
	ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RN
FROM Sales.Employees

--Rank employees based on salary (ties get same rank).

SELECT
	EmployeeID,
	FirstName,
	Salary,
	RANK() OVER(ORDER BY Salary DESC) AS rn
FROM Sales.Employees

--Use dense rank on employee salaries.

SELECT
	EmployeeID,
	FirstName,
	Salary,
	DENSE_RANK() OVER(ORDER BY Salary DESC)
FROM Sales.Employees

--Show a running total of sales per date.

SELECT 
	CustomerID,
	OrderDate,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderDate ORDER BY OrderDAte) AS Totalsales
FROM Sales.Orders

--Find the total number of orders
USE SalesDB

SELECT 
	
	Count(Sales) AS TotalNOofSales
FROM Sales.Orders

--Find the total sales of all orders

SELECT 
	SUM(Sales) AS TotalSales
FROM Sales.orders

--Average Sales

SELECT 
	AVG(Sales) AS AVGSales
FROM Sales.orders

--iHighest Sales

SELECT 
	MAX(Sales) AS maxSales,
	MIN(Sales) AS minsales
FROM Sales.orders

--Analyse the scores in customers table

SELECT *
FROM Sales.Customers

SELECT 
	AVG(score) AS avg_score,
	SUM(Score) AS TotalSales,
	MAX(Score) AS MxScore,
	MIN(Score) AS MinScore,
	COUNT(Score) AS Count_score
FROM Sales.Customers

 
--Find the total sales across all orders

SELECT 
	SUM(Sales) AS TotalSales
FROM Sales.Orders

--Find the total sales for each product

SELECT 
	ProductID,
	SUM(Sales) AS T_sales
FROM Sales.Orders
GROUP BY ProductID

--Find the total sales for each product,aditionally provide details such as orderid,orderdate

SELECT 
	ProductID,
	OrderID,
	OrderDate,
	SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY ProductID, OrderID,OrderDate

--Using Window function

SELECT 
	ProductID,
	OrderID,
	OrderDate,
	SUM(Sales) OVER(PARTITION BY ProductID)
FROM Sales.Orders

--Find the total sales across all orders,aditionally provide details such as orderid, orderdate
USE SalesDB
SELECT 
	OrderID,
	OrderDate,
	SUM(Sales) OVER() AS TotalSales
FROM Sales.orders

--Find the total sales for each product, additional details also

SELECT
	ProductID,
	OrderID,
	OrderDate,
	SUM(Sales) OVER(PARTITION BY ProductID) AS SalesBYProduct
FROM Sales.Orders

--Find the total sales for each combination of product and order status

SELECT
	ProductID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus ) AS TotalSalesbyCombination
FROM Sales.Orders

--Windown function using following and preceding
USE SalesDB
SELECT 
	ProductID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDAte 
	ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS S_total
FROM Sales.Orders
WHERE ProductID IN (101,102)

--RANK customers based on their total sales

SELECT
	CustomerID,
	SUM(Sales) AS TotalSales,
	RANK() OVER(ORDER BY SUM(Sales) DESC ) AS Rn_cusotmers
FROM Sales.Orders
GROUP BY CustomerID