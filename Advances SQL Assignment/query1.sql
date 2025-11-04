-- Find all films with maximum length or minimum replacement cost (compared to all other % films).
-- In other words let L be the maximum film length, and let R be the minimum replacement cost in the table film. 
-- You need to find all films that have length L or replacement cost R or both length L and replacement cost R.
-- If a film has either a maximum length OR a minimum replacement cost it should appear in the result set. 
-- It does not need to have both the maximum length AND minimum replacement cost.
-- You just need to return the film_id for this query.
-- Order your results by film_id in ascending order.

-- Put query for Q1 here
SELECT film_id FROM film 
WHERE length = (SELECT MAX(length) FROM film) 
OR replacement_cost = (SELECT MIN(replacement_cost) FROM film)
ORDER BY film_id ASC;