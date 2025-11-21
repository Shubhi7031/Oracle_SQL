SELECT TOP (1000)
    'orders' AS SourceTable,
        [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
  FROM [SalesDB].[Sales].[Orders]

UNION

  SELECT TOP (1000) 
    'OrdersArchive' AS sourceTable,
        [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
  FROM [SalesDB].[Sales].[OrdersArchive]
  ORDER BY OrderID

  ---------------------------------------------

 --Show a list of customers with their first name and country in one column

SELECT 
    FirstName,
    Country,
    CONCAT(FirstName,' ',Country) AS FullName
From Sales.Customers

--convert the customers firstname to lowercase

SELECT 
    firstName,
    LastName,
    upper(FirstName) AS Upp_firstName,
    lower(FirstName) AS Low_FirstName,
    upper(country) as Upp_Country
FROM Sales.Customers
 

 --Find the customers whose name contains leading and trailing space

 SELECT 
    FirstName,
    Trim(FirstName) as Trimmed,
    len(FirstName)-len(Trim(FirstName)) AS Flag
 FROM Sales.Customers

 --Replace

 SELECT 
    'File.txt' AS old,
    REPLACE('File.txt','.txt','.csv') AS new

SELECT
'13-09-1996' AS old_format,
REPLACE('13-09-1996','-','/')

----Length function
--Calculate the len of each customers firstname

SELECT
    FirstName,
    len(FirstName) AS len_firstname
FROM Sales.Customers

 
 --Extract the first 2 and last 2 characters of firstname from sales.cusotmers

 SELECT
    FirstName,
    LEFT(FirstName,2) AS Left_2Char,
    RIGHT(FirstName,2) AS Right_2Char
FROM Sales.Customers

--Extract the 2 char from firstname after Left_2char

SELECT 
    FirstName,
    SUBSTRING(FirstName,3,2) AS S_string
FROM Sales.Customers

--extract the char of firstname after 2 char

SELECT 
    firstname,
    SUBSTRING(FirstName,3,len(FirstName)) AS s_str
FROM sales.Customers

---Functions(Numbers)--

SELECT 
    3.823 as num,
    ROUND(3.823,3) AS round_3,
    ROUND(3.823,2) AS round_2,
    ROUND(3.823,1) AS round_1,
    ROUND(3.823,0) AS round_0

--Absolute function(ABS)

SELECT -10 AS num , ABS(-10) AS abs_num

--DATETIME
USE SalesDB
SELECT 
    OrderDate,
    ShipDate,
    CreationTime,
    '11-16-2025' HARDCODE,
    GETDATE() AS Today
FROM Sales.Orders

--
SELECT 
    OrderID,
    CreationTime,
    YEAR(CreationTime) AS year_,
    MONTH(CreationTime) AS month_,
    DAY(CreationTime) AS day_,
    DATEPART(MONTH, CreationTime) AS dp_month,
    DATENAME(MONTH, CreationTime) AS dn_month,
    DATEPART(YEAR, CreationTime) AS dp_year,
    DATEPART(DAY, CreationTime) AS dp_day,
    DATENAME(WEEKDAY, CreationTime) AS dn_day,
    DATEPART(HOUR, CreationTime) AS dp_hour,
    DATEPART(MINUTE, CreationTime) AS dp_min,
    DATEPART(SECOND, CreationTime) AS dp_sec,
    DATEPART(MILLISECOND, CreationTime) AS dp_milisec,
    DATEPART(WEEK, CreationTime) AS dp_week,
    DATEPART(QUARTER, CreationTime) AS dp_Quar
FROM Sales.Orders

----------------------------------------------------------------------------------


