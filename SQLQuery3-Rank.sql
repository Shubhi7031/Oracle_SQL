--Find the Total number of orders

SELECT
	ProductID,
	Sales,
	COUNT(*) AS TOTAlOrders
FROM Sales.Orders
GROUP BY ProductID, Sales
Order BY ProductID

--Find the total number of orders for each customer

SELECT 
	CustomerID,
	COUNT(*)
FROM Sales.Orders
GROUP BY CustomerID

--Find the total number of customers, additionally provide all customer details

SELECT 
	*,
	COUNT(*) OVER() AS TotalCustomers
FROM Sales.Customers

------

SELECT
	ProductID,
	OrderDate,
	COUNT(*) OVER(PARTITION BY ProductID) AS TotalOrders
FROM Sales.Orders

--check whether the 'orders' tables contains any duplicate rows

SELECT 
	OrderID,
	COUNT(*) OVER(PARTITION BY OrderID) AS CheckPK
FROM Sales.Orders

SELECT *
FROM (SELECT	
	OrderID,
	COUNT(*) OVER( PARTITION BY OrderID) AS CheckDuplicates
FROM Sales.OrdersArchive)t
WHERE CheckDuplicates>1

--Find the total sales across all orders and the total sales for each product.
--Additonally, provide details such orderID and orderdate

SELECT 
	OrderID,
	ProductID,
	Sales,
	SUM(Sales) OVER() AS TotalSales,
	SUM(Sales) OVER (PARTITION By ProductID) AS TotalSalesByProduct
FROM Sales.Orders

--Find the percentage contribution of each product's sales to the total sales

SELECT 
	OrderID,
	ProductID,
	Sales,
	SUM(Sales) OVER() AS TotalSales,
	ROUND(CAST(Sales AS FLOAT)/SUM(Sales) OVER()*100,2) AS PercentContributionEachSales
FROM Sales.Orders
ORDER BY ROUND(CAST(Sales AS FLOAT)/SUM(Sales) OVER()*100,2) DESC

--Find the avg sales across all orders
--And find the avg sales for each product
--additionally provide details such as orderid, orderdate

SELECT
	OrderID,
	OrderDate,
	Sales,
	ProductID,
	AVG(Sales) OVER() AS avg_sales,
	AVG(Sales) OVER(PARTITION BY ProductID) AS avgsalesByProduct
FROM Sales.Orders

--find the average scores of customers,also provide customer ID and lastname

SELECT 
	CustomerID,
	LastName,
	AVG(COALESCE(Score,0)) OVER() AS avg_score
FROM Sales.Customers

--Find all orders where sales are higher than the avg sales across all orders

SELECT *
FROM
	(SELECT 
		OrderID,
		Sales,
		AVG(Sales) OVER() AS AvgSales
	FROM Sales.Orders)t
WHERE Sales>AvgSales

--Find the highest and lowest sales across all orders
--And Find the highest and lowest sales for each product
-- and provide details orderdate and orderid
USE SalesDB
SELECT 
	OrderId,
	ProductId,
	OrderDate,
	Sales,
	MAX(Sales) OVER() AS max_sales,
	MIN(Sales) OVER() AS min_sales,
	MAX(Sales) OVER(PARTITION BY ProductID) AS max_salesByProduct,
	MIN(Sales) OVER(PARTITION BY ProductID) AS min_salesByProduct
FROM Sales.Orders

--Show the employee with the highest salary
SELECT
* FROM 
(
SELECT 
	EmployeeID,
	FirstName,
	Salary,
	MAX(Salary) OVER() AS HighestSalary
FROM Sales.Employees)t
WHERE Salary= HighestSalary

--Find the deviation of each sales from max and min amounts

SELECT 
	OrderID,
	ProductId,
	Sales,
	MAX(Sales) OVER() AS MaxSalary,
	MIN(Sales) OVER() AS MinSalary,
	Sales- MIN(Sales) OVER() AS DevfromMin,
	MAX(Sales) OVER()-Sales AS DevFromMax
FROM Sales.Orders

--Calculate the moving average of sales for each product over time

SELECT 
	OrderID,
	ProductId,
	Sales,
	AVG(Sales) OVER(PARTITION BY ProductId ORDER BY ProductID 
	ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS MovingSales
FROm Sales.Orders

--Rank the orders based on their sales from highest to lowest
USE SalesDB
SELECT
	OrderId,
	OrderDate,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) AS Row_num,
	RANK() OVER(ORDER BY Sales DESC) AS Rank_,
	DENSE_RANK() OVER(ORDER BY Sales DESC) AS Den_Rank
FROM Sales.Orders

--Find the top highest sales for each product
SELECT *
FROM (
SELECT
	OrderID,
	ProductId,
	Sales,
	ROW_NUMBER() OVER(PARTITION BY Productid ORDER BY Sales DESC) AS R_rank
FROM Sales.Orders)t
WHERE R_rank=1

--Find the lowest 2 customers based on their sales

SELECT * 
FROM
(SELECT 
	CustomerID,
	SUM(Sales) AS TotalSales,
	ROW_NUMBER() OVER(ORDER BY SUM(Sales)) AS Rank_sales
FROm Sales.Orders
GROUP BY CustomerID)t
WHERE Rank_sales<=2

--Assign unique IDs to the rows of orderArchive table

SELECT *,	
	ROW_NUMBER() OVER(ORDER BY OrderID) AS UniqId
FROM Sales.OrdersArchive