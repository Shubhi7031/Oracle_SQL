USE MyDatabase

SELECT * 
FROM customers

-- Retrieve customers whose score is not equal to zero

SELECT *
FROM customers
WHERE score!=0

-- Retieve customers from Germany

SELECT *
FROM customers
WHERE country = 'Germany'

SELECT 
	first_name,
	country
FROM customers
WHERE country= 'Germany'

--Retrieve all customers and sort the results by the highest score first

SELECT *
FROM customers
ORDER BY score DESC

SELECT * 
FROM customers
ORDER BY 
	country ASC,
	score DESC
	
-- Find the total score for each country

SELECT 
	country,
	sum(score) as Total
FROM customers
GROUP BY country

--Find the total score for each country

SELECT 
	country,
	sum(score) as total
FROM customers
GROUP BY country
ORDER BY total DESC

SELECT * 
FROM customers

--Find the total score and total number of customer for each country

SELECT 
	sum(score) as total_score,
	count(id) as total_id
FROM customers
GROUP BY country

/*Find the average score for each country considering only customers with score not equal to 0
and return only those countries with an average score greater than 430 */

SELECT 
	avg(score) as average_score,
	country
FROM customers
WHERE score !=0
GROUP BY country
HAVING avg(score)>430
ORDER BY average_score DESC

-- Return unique list of all customers

SELECT DISTINCT
	country
FROM customers

-- Retrieve only 3 customers

SELECT TOP 3
	*
FROM customers

-- Retrieve the top 3 customers with the highest score

SELECT TOP 3 *
FROM customers
ORDER BY score DESC

-- Retrieve lowest 2 customers based on the scores

SELECT TOP 2 *
FROM customers
ORDER BY score 

--Get the 2 most recent orders

SELECT TOP 2 *
FROM orders
ORDER BY order_date DESC

-- create a new table called persons with columns:id,person_name,birth_date and phone

CREATE TABLE persons(
	id int NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(20) NOT NULL
	CONSTRAINT pk_persons PRIMARY KEY (id)

)

SELECT * FROM persons

--Add a column EMail to the table persons

ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL

--Remove a phone column from persons table

ALTER TABLE persons
DROP COLUMN phone

-- DROP the table persons

DROP TABLE persons

SELECT * FROM customers

INSERT INTO customers (id, first_name, country, score) 
VALUES
	(7, 'Jack', 'India', 500),
	(8, 'Jim', 'USA', 700)

SELECT * FROM customers

-- insert data from table customers to table persons
INSERT INTO persons (id,person_name,birth_date,phone)
SELECT 
	id,
	first_name,
	NULL,
	'Unknown'
FROM customers

SELECT * FROM persons

--change the score of customer 6 to zero

UPDATE customers
SET score= 0
WHERE id=6

SELECT * 
FROM customers
WHERE id=6

UPDATE customers
SET country= 'India',
	score= 900
WHERE id= 5

UPDATE customers
SET score= 0
WHERE score is NULL

--Delete all customers with id>5

DELETE customers
WHERE id>5

UPDATE customers
SET country= 'UK'
WHERE id=5

--delete all data from persons table

TRUNCATE TABLE persons