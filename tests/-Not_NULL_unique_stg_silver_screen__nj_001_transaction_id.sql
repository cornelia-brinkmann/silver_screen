SELECT 
    transaction_id,
    COUNT (*) AS COUNT
FROM {{ source ('silver_screen', 'nj_001')}}
WHERE transaction_id IS NULL
GROUP BY transaction_id
HAVING COUNT (*) > 1