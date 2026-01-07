SELECT
    rental_cost
FROM {{ ref('cinema_profitability') }}
WHERE rental_cost is Null