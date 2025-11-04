-- Find the film_title of all films which feature both UMA WOOD and FRED COSTNER
-- Order the results by film_title in descending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box 
--  to figure out how to get a table that shows pairs of actors in movies.

-- Put your query for Q5 here.
SELECT UW.title AS film_title FROM 
(SELECT film.film_id, film.title FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name = "UMA" AND actor.last_name = "WOOD"
GROUP BY film_id
ORDER BY film.title DESC) AS UW
JOIN 
(SELECT film.film_id, film.title FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name = "FRED" AND actor.last_name = "COSTNER"
GROUP BY film_id
ORDER BY film.title DESC) AS FC
WHERE UW.film_id = FC.film_id
ORDER BY film_title DESC;