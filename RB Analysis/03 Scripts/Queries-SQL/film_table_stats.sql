--Film Table stats 

SELECT	MIN(rental_rate) AS rental_rate_min,
		MAX(rental_rate)AS rental_rate_max,
		ROUND(AVG(rental_rate),2) AS rental_rate_avg,
		MIN(rental_duration) AS rental_duration_min,
		MAX(rental_duration)AS rental_duration_max,
		ROUND(AVG(rental_duration),3) AS rental_duration_avg,
		MIN(length) AS film_length_min,
		MAX(length) AS film_length_max,
		ROUND(AVG(length),2) AS film_length_avg,
		MIN(replacement_cost) AS replacement_cost_min,
		MAX(replacement_cost) AS replacement_cost_max,
		ROUND(AVG(replacement_cost),2) AS replacement_cost_avg
FROM film;
