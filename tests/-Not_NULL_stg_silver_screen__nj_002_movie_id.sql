SELECT
    movie_id
FROM {{ ref('stg_silver_screen__nj_002') }}
WHERE movie_id is NULL
