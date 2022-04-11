-- Hello World SQL Query, SELECT all records from actor table
SELECT *
FROM actor;

-- Query for first_name and last_name data in the actor table
SELECT first_name, last_name
FROM actor;

-- Query for first_names that equal Nick using WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query for a first_name that equals Nick using the LIKE and WHERE clauses
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_name data that starts with "J" using the LIKE and WHERE clauses
-- and the %(wildcard)
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that start with "K" and has 2 letters after
-- using LIKE, WHERE and underscores (__)
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_name data that starts with K and ends with "th"
-- using LIKE, WHERE, wildcard(%) and underscore(_)
SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name LIKE 'K__%th';

-- Comparing operators are:
-- Greater than (>) -- Less than (<)
-- Greater or Equal(>=) -- Less or Equal (<=)
-- Not Equal (<>)

-- Explore Data in the payment table with a SELECT ALL(*)
SELECT *
FROM payment;

-- Query for data that shows customers who paid
-- an amount greater than $2
SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

-- Query for data showing who paid 
-- an amount less than $7.99
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- Query for data showing who paid
-- an amount less than or equal to $4.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 4.99;

-- Query for data showing who paid
-- an amount greater than or equal to $7.99
SELECT customer_id, amount, payment_id
FROM payment
WHERE amount >= 7.99;

-- Query for data showing who paid
-- an amount greater than or equal to $2.00
-- in ascending order
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount;

-- Query for data showing amounts paid
-- BETWEEN $2.00 AND $7.99
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query for data showing customers who paid
-- an amount NOT EQUAL(<>) to $ 0.00
-- ORDER BY descending order
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- Explore the other tables

-- film
SELECT *
FROM film;

-- film titles that start with "D"

SELECT title, length
FROM film
WHERE title LIKE 'D%';

-- film titles that are longer than 120

SELECT title, length
FROM film
WHERE length >= 120
ORDER BY length DESC;

-- rentals
SELECT *
FROM rental;

-- rentals order by return date and find between certain dates
SELECT rental_date, return_date
FROM rental
WHERE rental_date BETWEEN '2005-05-01_%' AND '2005_06-01_%'
ORDER BY return_date;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()
-- Query to display the SUM() of amounts greater than 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Display the average of amounts greater than 5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Display the count of amounts greater than 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the DISTINCT count of amounts
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- Query to display the MAX() amount greater than 7.99
SELECT MAX(amount)
FROM payment
WHERE amount > 7.99;

-- Query to display the MIN() amount greater than 7.99
SELECT MIN(amount)
FROM payment
WHERE amount > 7.99;

SELECT amount
FROM payment
WHERE amount = 7.99;

-- Query to display different amounts grouped together
-- along with their count
SELECT amount, COUNT(amount) as amount_num
FROM payment
GROUP BY amount
ORDER BY amount_num DESC;

-- Query to display customer ids grouped together with their summed amounts
SELECT customer_id, SUM(amount) as total
FROM payment
GROUP BY customer_id
ORDER BY total DESC;

-- Query to display customer_ids and their amounts grouped by the customer id and amount
SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id;

-- Query to display info from the customer table
SELECT *
FROM customer;

-- Query to display the customer ids that show up more than five times
-- group them by the customers email
SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__%.org'
GROUP BY email
HAVING COUNT(customer_id) > 0;



