SELECT
    movie_id
FROM {{ ref('stg_silver_screen__nj_003') }}
WHERE movie_id is NULL

