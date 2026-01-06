SELECT 
    DATE_TRUNC ('month', date ) :: DATE AS month,
    COALESCE (transaction_id, 'Unknown') AS transaction_id,
    COALESCE (movie_id, 'Unknown') AS movie_id,
    'NJ_001' AS location_id, -- additional column for location
    COALESCE (ticket_amount, 0) AS ticket_amount,
    COALESCE (ticket_price, 0) AS ticket_price,
    COALESCE (total_value, 0) AS total_value
FROM {{ source ('silver_screen', 'nj_001')}}
