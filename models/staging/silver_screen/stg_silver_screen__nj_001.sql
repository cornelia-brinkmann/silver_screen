SELECT 
    DATE_TRUNC ('month', date ) AS month,
    transaction_id,
    movie_id,
    'nj_001' AS location,
    ticket_amount,
    ticket_price,
    total_value
FROM {{ source ('silver_screen', 'nj_001')}}
