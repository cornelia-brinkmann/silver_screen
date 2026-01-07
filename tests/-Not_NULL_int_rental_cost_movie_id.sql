SELECT
    movie_id
FROM {{ ref('int_rental_cost') }}
WHERE movie_id is Null