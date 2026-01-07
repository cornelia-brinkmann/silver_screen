WITH ranked_invoices AS (

    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY invoice_id
            ORDER BY date DESC
        ) AS rn
    FROM {{ source ('silver_screen', 'invoices' )}}

)

SELECT 
    movie_id,
    invoice_id,
    date,
    location_id,
    studio,
    release_date,
    weekly_price,
    total_invoice_sum
FROM ranked_invoices
QUALIFY rn = 1
