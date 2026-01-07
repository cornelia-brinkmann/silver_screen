SELECT 
    movie_id
FROM {{ ref('int_location') }}
WHERE movie_id is Null