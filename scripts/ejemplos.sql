USE sakila;

SELECT
        first_name
        ,last_name
        ,address
        ,postal_code
        ,city
        ,country
        ,phone
    FROM customer
        INNER JOIN address USING(address_id)
        INNER JOIN city USING(city_id)
        INNER JOIN country USING(country_id)
    ORDER BY first_name
    LIMIT 5
    ; 

SELECT
        film_id
        ,title
        ,category.name AS category
    FROM inventory
        LEFT JOIN film USING(film_id)
        LEFT JOIN film_category USING(film_id)
        LEFT JOIN category USING(category_id)
    LIMIT 5
    ;

SELECT
    film_id,
    title,
    category.name AS category,
    rental.rental_date,
    year(rental.rental_date) rental_year,
    month(rental.rental_date) rental_month,
    day(rental.rental_date) rental_day
FROM inventory
    LEFT JOIN rental USING(inventory_id)
    LEFT JOIN film USING(film_id)
    LEFT JOIN film_category USING(film_id)
    LEFT JOIN category USING(category_id)
LIMIT 10
 ;   