{{config(materialized='table')}}



SELECT

n1.month,

COALESCE (n1.transaction_id, n3.transaction_id, 'unknown') AS transaction_id,

COALESCE (n1.movie_id, n2.movie_id,'unknown') AS movie_id,

n1.location_id,

n1.ticket_amount,

n1.ticket_price,

n1.total_value



FROM {{ ref('stg_silver_screen__nj_001') }} n1

LEFT JOIN

{{ ref('stg_silver_screen__nj_003') }} n3

ON n1.transaction_id = n3.transaction_id

LEFT JOIN

{{ ref('stg_silver_screen__nj_002') }} n2

ON n1.movie_id = n2.movie_id






