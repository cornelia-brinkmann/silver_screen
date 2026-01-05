SELECT 
    DATE_TRUNC ('month', date ) AS month,
    'nj_002' AS location
    ticket_amount,
    ticket_price,
    total_value
FROM {{ source ('silver_screen', 'nj_002')}}