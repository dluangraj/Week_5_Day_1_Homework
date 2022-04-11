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

--HOMEWORK

-- Question 1: How many actors are there with the last name 'Wahlberg'?
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';
-- Answer: 2

--Question 2: How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 7.99;
-- Answer: 7250

-- Question 3: What film does the store have the most of?
SELECT COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;
-- Answer: There are 72 films that have 8 each. (?)

-- Question 4: How many customers have the last name "William"?
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';
-- Answer: 0

-- Question 5: What store employee sold the most rentals?

SELECT COUNT(staff_id)
FROM payment
WHERE staff_id = '1';
-- 7292
SELECT COUNT(staff_id)
FROM payment
WHERE staff_id = '2';
-- 7304
-- Answer: staff id #2

--Question 6: How many different district names are there?
SELECT COUNT(DISTINCT district)
FROM address;
-- Answer: 378

-- Question 7: What film has the most actors in it?
SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;
-- Answer: film_id: 508 has 15 actors

-- Question 8: From store_id 1, how many customers have a last name ending with "es"?
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es';
-- Answer: 21

-- Question 9: How many payment amounts had a number of rentals above 250 for customers with ids between 380 and 430?
SELECT amount, COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(customer_id) > 250;
-- Answer: 3

-- Question 10: Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;
-- Answer: 5 categories, and PG-13 has the most at 223 films









