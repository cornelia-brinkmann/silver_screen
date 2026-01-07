SELECT 
    invoice_id,
    COUNT (*) AS COUNT
FROM {{ ref('stg_silver_screen__invoices') }}
GROUP BY invoice_id
HAVING COUNT (*) > 1