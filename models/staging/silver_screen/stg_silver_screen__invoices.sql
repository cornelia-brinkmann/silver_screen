SELECT 
    movie_id,
    invoice_id,
    date AS month,
    location_id,
    studio,
    total_invoice_sum AS rental_cost
FROM {{ ref('stg_silver_screen__invoices_dedup') }}
