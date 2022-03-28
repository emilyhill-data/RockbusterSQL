WITH inventory_cte(category_id, inv_cnt) AS (
SELECT 	fc.category_id, 
		COUNT(i.inventory_id)
FROM inventory i
JOIN film f 
ON i.film_id = f.film_id
JOIN film_category fc 
ON f.film_id = fc.film_id
JOIN category c 
ON fc.category_id = c.category_id
GROUP BY fc.category_id)

SELECT 	c.name,
		inventory_cte.inv_cnt,
		COUNT(DISTINCT i.film_id) AS cnt_of_films, 
		COUNT(r.rental_id) AS cnt_of_pd_rentals,
		SUM(p.amount) AS sum_of_revenue
FROM category c
JOIN film_category f 
ON c.category_id = f.category_id
JOIN inventory i 
ON f.film_id = i.film_id
JOIN rental r 
ON i.inventory_id = r.inventory_id
JOIN payment p 
ON r.rental_id = p.rental_id
JOIN inventory_cte 
ON f.category_id = inventory_cte.category_id
GROUP BY c.name, inventory_cte.inv_cnt
ORDER BY SUM(p.amount) DESC;
