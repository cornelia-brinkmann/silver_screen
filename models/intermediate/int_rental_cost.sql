{{config (materialized='table')}}

SELECT 
    m.movie_id,
    m.movie_title,
    m.genre_clean as genre,
    m.studio,
    i.date AS month,
    i.location_id,
    i.total_invoice_sum AS rental_cost
FROM {{ ref('stg_silver_screen__movies') }} m
RIGHT JOIN
{{ source ('silver_screen', 'invoices') }} i
ON m.movie_id = i.movie_id

