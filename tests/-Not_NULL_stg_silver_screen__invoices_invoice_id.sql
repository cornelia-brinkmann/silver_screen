SELECT
    invoice_id
FROM {{ ref('stg_silver_screen__invoices') }}
WHERE invoice_id is NULL