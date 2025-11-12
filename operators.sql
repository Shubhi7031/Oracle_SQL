USE MyDatabase

SELECT *
FROM customers
WHERE score BETWEEN 0 and 500

-- Retrieve all customers from either USA or Germany

SELECT * 
FROM customers
WHERE country= 'USA' OR country ='Germany'

SELECT * 
FROM customers
WHERE country NOT IN ('USA', 'Germany')

-- Find all customers whose name starts with M

SELECT *
FROM customers
WHERE first_name LIKE 'M%'


-- Find all customers whose name ends with N

SELECT *
FROM customers
WHERE first_name LIKE '%N'

-- Find all customers whose first name contains R

SELECT * 
FROM customers
WHERE first_name LIKE '%r%'

-- Find all customers whose first name contains R in the 3rd position

SELECT *
FROM customers
WHERE first_name LIKE '__r%'