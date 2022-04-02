--Revenue & # of rentals (by country)

WITH payment_cte(customer_id, amount) AS 
(
	SELECT customer_id, SUM(amount)
	FROM payment
	GROUP BY customer_id
	ORDER BY customer_id
)

SELECT	country.country,
		COUNT(c.customer_id) AS number_of_customers,
		SUM(payment_cte.amount) AS total_revenue
FROM customer c
JOIN address 
ON address.address_id = c.address_id
JOIN city 
ON city.city_id = address.city_id
JOIN country 
ON city.country_id = country.country_id
JOIN payment_cte 
ON c.customer_id = payment_cte.customer_id
GROUP BY country.country
ORDER BY country.country;
