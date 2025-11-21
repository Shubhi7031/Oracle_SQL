USE MyDatabase;

SELECT * 
FROM employee

SELECT * 
FROM orders

SELECT *
FROM persons

SELECT *
FROM employee AS e
LEFT JOIN orders AS o
ON e.emp_id=o.customer_id

--Get all customers and all orders even if there is no match
SELECT *
FROM employee
FULL JOIN orders
ON employee.emp_id=orders.customer_id

--Get all customers who haven't placed any order
SELECT * 
FROM orders AS o
LEFT JOIN employee AS e
ON o.customer_id=e.emp_id
WHERE e.emp_id is NULL


--Get all the orders without matching cusotmers

SELECT *
FROM orders AS o
LEFT JOIN customers AS c
on o.customer_id=c.id
WHERE c.id is NULL

--Find customers without orders and orders without customers

SELECT *
FROM customers AS c
FULL JOIN orders AS o
ON c.id= o.customer_id
WHERE c.id is NULL or o.customer_id is NULL

--Get all the customers along with their orders but only for customers who placed an order

SELECT *
FROM customers AS c
LEFT JOIN orders as o
ON c.id= o.customer_id
WHERE o.customer_id is NOT NULL


--USING SalesDB, Retrieve a list of all orders, 
--along with the related customer, product and employee details
--for each order, display- orderID, customers name, product name, sales amount,
--product price, salesperson name

USE SalesDB

SELECT * FROM Sales.Customers
SELECT * FROM Sales.Employees
SELECT * FROM Sales.Orders
SELECT * FROM Sales.OrdersArchive
SELECT * FROM Sales.Products

--USING SalesDB, Retrieve a list of all orders, 
--along with the related customer, product and employee details
--for each order, display- orderID, customers name, product name, sales amount,
--product price, salesperson name

SELECT 
	o.orderID,
	o.Sales,
	c.firstname AS CustFirstName,
	c.lastname AS CustLastName,
	p.product,
	p.price,
	e.FirstName AS EmpFirstName,
	e.LastName AS EmpLastName

FROM Sales.orders as o
LEFT JOIN sales.Customers as c
ON o.CustomerID= c.CustomerID
LEFT JOIN sales.products as p
ON o.ProductID=p.ProductID
LEFT JOIN sales.Employees as e
ON o.SalesPersonID=e.EmployeeID

