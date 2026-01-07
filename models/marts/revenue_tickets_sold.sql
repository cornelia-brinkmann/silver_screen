{{config (materialized = 'table')}}

SELECT 
    movie_id,
    transaction_month,
    location_id,
    COUNT (tickets_sold) AS tickets_sold,
    SUM (revenue) AS total_revenue
FROM {{ ref('int_location') }}
GROUP BY 
    movie_id,
    transaction_month,
    location_id
    
