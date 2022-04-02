-Lowest Rental Revenue

SELECT	f.film_id,
		f.title,
		f.rating,
		c.name AS category,
		COUNT(p.rental_id) AS ct_of_rentals,
		SUM(p.amount) AS rev_of_rentals
FROM film f
INNER JOIN inventory i 
ON f.film_id = i.film_id
INNER JOIN rental r 
ON i.inventory_id = r.inventory_id
INNER JOIN payment p 
ON r.rental_id = p.rental_id
INNER JOIN film_category fc 
ON i.film_id = fc.film_id
INNER JOIN category c 
ON fc.category_id = c.category_id
GROUP BY f.film_id, f.title, c.name
ORDER BY SUM(p.amount)
LIMIT 30;
