SELECT

transaction_id,

COUNT (*) AS COUNT

FROM {{ source ('silver_screen', 'nj_003')}}

WHERE transaction_id IS NULL

GROUP BY transaction_id

HAVING COUNT (*) > 1