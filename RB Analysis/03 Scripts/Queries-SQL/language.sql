--What language?

SELECT	l.name,
		COUNT(i.inventory_id)
FROM inventory i
INNER JOIN film f 
ON i.film_id = f.film_id
RIGHT JOIN language l 
ON f.language_id = l.language_id
GROUP BY l.name;
