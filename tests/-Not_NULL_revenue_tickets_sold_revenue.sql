SELECT
    total_revenue
FROM {{ ref('revenue_tickets_sold') }}
WHERE total_revenue is NULL