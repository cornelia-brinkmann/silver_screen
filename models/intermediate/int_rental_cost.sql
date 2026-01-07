{{config (materialized='table')}}

SELECT 
    m.movie_id,
    m.movie_title,
    m.genre_clean as genre,
    m.studio,
    i.month, 
    i.location_id,
    i.rental_cost
FROM {{ ref('stg_silver_screen__movies') }} m
LEFT JOIN
{{ ref('stg_silver_screen__invoices') }} i
ON m.movie_id = i.movie_id 



