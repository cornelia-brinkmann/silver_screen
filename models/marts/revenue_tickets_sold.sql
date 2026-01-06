{{config (materialized = 'table')}}

SELECT 
    movie_id,
    month,
    location_id,
    COUNT (ticket_amount) AS tickets_sold,
    SUM (ticket_price) AS total_ticket_price,
    SUM (total_value) AS revenue
FROM {{ ref('int_location') }}
GROUP BY 
    movie_id,
    month,
    location_id
    
ORDER BY revenue