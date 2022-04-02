--Late Revenue Data

SELECT	COUNT(r.rental_id) AS number_of_late_rentals,
		(SELECT COUNT(rental_id)
		FROM payment) AS total_number_of_paid_rentals,
		SUM(f.rental_rate) AS base_late_rental_revenue,
		SUM(p.amount) - SUM(f.rental_rate) AS late_fees,
		SUM(p.amount) AS late_rental_revenue,
		(SELECT	SUM(p.amount)
		FROM payment p
 		JOIN rental r 
		ON p.rental_id = r.rental_id
 		JOIN inventory i 
		ON r.inventory_id = i.inventory_id
 		JOIN film f 
		ON i.film_id = f.film_id
 		WHERE p.amount = f.rental_rate) AS on_time_rental_revenue,
 		(SELECT	SUM(amount) 
 		FROM payment) AS total_revenue
FROM film f
JOIN inventory i 
ON f.film_id = i.film_id
JOIN rental r 
ON i.inventory_id = r.inventory_id
JOIN payment p 
ON r.rental_id = p.rental_id
JOIN (	SELECT p.payment_id
		FROM payment p
		JOIN rental r 
	  	ON p.rental_id = r.rental_id
		JOIN inventory i 
	  	ON r.inventory_id = i.inventory_id
		JOIN film f 
	  	ON i.film_id = f.film_id
		WHERE p.amount <> f.rental_rate) AS late_payments 
ON p.payment_id = late_payments.payment_id
