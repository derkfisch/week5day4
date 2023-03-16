--Question 1

SELECT *
FROM film;

INSERT INTO film(title, description, release_year, language_id, rental_duration,
rental_rate, length, replacement_cost, rating, last_update)
VALUES ('Fear and Loathing in Las Vegas', 'a whacky search for the American Dream', 1998, 1, 2, 4.99, 118, 12.99, 'R', NOW());

SELECT *
FROM film
ORDER BY film desc;

--Question 2
SELECT *
FROM film_category;

CREATE OR REPLACE FUNCTION get_film_count(letter VARCHAR(1))
RETURNS INTEGER
LANGUAGE plpgsql 
AS $$
	DECLARE film_count INTEGER;
BEGIN
	SELECT film_id, COUNT(category_id) INTO film_count
	FROM film_category
	GROUP BY COUNT(category_id);
	RETURN film_count;
END;
$$;

--Not completely sure what I'm doing with this one