SELECT
    movie_id,
    COUNT (*) AS count
FROM {{ ref('stg_silver_screen__movies') }}
WHERE movie_id is NULL
GROUP BY movie_id
HAVING COUNT (*) > 1