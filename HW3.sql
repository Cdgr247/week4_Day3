1. --- 

SELECT CONCAT (first_name,' ' ,last_name) AS Name, district
FROM customer 
JOIN address
ON customer.address_id = address.address_id 
WHERE district = 'Texas';

2. ---
SELECT CONCAT (first_name,' ' ,last_name) AS full_name, amount
FROM customer 
JOIN payment  
ON customer.customer_id  = payment.customer_id  
WHERE amount > 6.99;

3. ---
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id 
	HAVING SUM (amount) > 175
	ORDER BY SUM (amount) DESC
);

4. ---
SELECT CONCAT(first_name,' ' ,last_name) AS full_name, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city 
ON address .city_id = city.city_id
JOIN country
ON city.country_id = country.country_id 
WHERE country = 'Nepal';

5. ---
SELECT CONCAT(first_name,' ' ,last_name) AS full_name, COUNT(amount) AS total_transactions
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id 
GROUP BY full_name
ORDER BY COUNT(amount) DESC 

6. ---
SELECT rating, count(rating) AS total_movies_for_rating 
FROM film
GROUP BY rating;

7. ---
SELECT CONCAT(first_name,' ' ,last_name) AS full_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id 
	FROM payment
	GROUP BY customer_id 
	HAVING SUM (amount) > 6.99
	ORDER BY SUM (amount) DESC
);
 8. ---
SELECT count(rental_id) AS total_free_rentals_given 
FROM rental
WHERE rental_id  IN (
	SELECT rental_id
	FROM payment
	GROUP BY rental_id 
	HAVING SUM (amount) = 0
);