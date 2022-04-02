--Category info: count by inventory/title, revenue, rev/title, rev/inv
--Exported to Tableau to create treemap

SELECT 	c.category_id,
		c.name,
		COUNT(DISTINCT i.inventory_id) AS ct_inventory,
		COUNT(DISTINCT i.film_id) AS ct_titles,
		SUM(p.amount) AS revenue_earned,
		ROUND((SUM(p.amount)/COUNT(DISTINCT i.film_id)),2) AS rev_per_title,
		ROUND((SUM(p.amount)/COUNT(DISTINCT i.inventory_id)),2) AS rev_per_inventory
FROM inventory i
LEFT JOIN film_category fc 
ON i.film_id = fc.film_id
LEFT JOIN category c 
ON fc.category_id = c.category_id
JOIN rental r 
ON i.inventory_id = r.inventory_id
JOIN payment p 
ON r.rental_id = p.rental_id
GROUP BY c.category_id
ORDER BY rev_per_inventory DESC
