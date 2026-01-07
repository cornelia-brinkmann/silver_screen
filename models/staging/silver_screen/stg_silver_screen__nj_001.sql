SELECT 
    DATE_TRUNC ('month', date ) :: DATE AS transaction_month,
    COALESCE (movie_id, 'Unknown') AS movie_id,
    'NJ_001' AS location_id, -- additional column for location
    COALESCE (ticket_amount, 0) AS tickets_sold,
    COALESCE (total_value, 0) AS revenue
FROM {{ source ('silver_screen', 'nj_001')}}
