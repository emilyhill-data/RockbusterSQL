-- Rental Count, film, inventory (by rating)

SELECT	f.rating AS rating,
		COUNT(p.rental_id) AS ct_of_rentals,
		COUNT(DISTINCT i.inventory_id) AS ct_of_inventory,
		COUNT(DISTINCT i.film_id) AS ct_of_films,
		SUM(p.amount) AS rev_of_rentals,
		(COUNT(p.rental_id))/(COUNT(DISTINCT i.film_id)) AS rentals_per_film
FROM film f
INNER JOIN inventory i 
ON f.film_id = i.film_id
LEFT JOIN rental r 
ON i.inventory_id = r.inventory_id
LEFT JOIN payment p 
ON r.rental_id = p.rental_id
GROUP BY f.rating
ORDER BY SUM(p.amount) DESC
