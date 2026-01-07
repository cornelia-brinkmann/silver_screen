SELECT
    transaction_month
FROM {{ ref('revenue_tickets_sold') }}
WHERE transaction_month is NULL