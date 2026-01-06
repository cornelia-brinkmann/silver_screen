{{config(materialized='table')}}

-- Data from NJ_001 (complete)

SELECT
    month,
    transaction_id,
    movie_id,
    location_id,
    ticket_amount,
    ticket_price,
    total_value

FROM {{ ref('stg_silver_screen__nj_001') }} 

UNION ALL

-- Data from NJ_002 with an artificial transaction_id 

SELECT 

    month,
    transaction_id,
    movie_id,
    location_id,
    ticket_amount,
    ticket_price,
    total_value

FROM {{ ref('stg_silver_screen__nj_002') }} 


UNION ALL

-- Data from NJ_003 (changed the column details in raw table into movie_id in Snowflake and filter product_type = 'ticket')

SELECT 
    month,
    transaction_id,
    movie_id,
    location_id,
    ticket_amount,
    ticket_price,
    total_value

FROM {{ ref('stg_silver_screen__nj_003') }} 








