{{config (materialized='table')}}

SELECT 
    m.movie_id,
    m.movie_title,
    m.genre_clean as genre,
    m.studio,
    i.date AS month, -- in raw table was it month but I changed it in snowflake in date as I did not know if I need date for further aggregation
    i.location_id,
    SUM (i.total_invoice_sum) AS rental_cost
FROM {{ ref('stg_silver_screen__movies') }} m
INNER JOIN
{{ source ('silver_screen', 'invoices') }} i
ON m.movie_id = i.movie_id 
GROUP BY
    m.movie_id,
    m.movie_title,
    genre,
    m.studio,
    month,
    i.location_id
ORDER BY month, i.location_id


