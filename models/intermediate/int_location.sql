{{config(materialized='table')}}

-- Data from NJ_001 (complete)

SELECT
    *

FROM {{ ref('stg_silver_screen__nj_001') }} 

UNION ALL

-- Data from NJ_002 with an artificial transaction_id 

SELECT 

    *

FROM {{ ref('stg_silver_screen__nj_002') }} 


UNION ALL

-- Data from NJ_003 (changed the column details in raw table into movie_id in Snowflake and filter product_type = 'ticket')

SELECT 
    *

FROM {{ ref('stg_silver_screen__nj_003') }} 








