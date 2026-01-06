with 

source as (

    select * from {{ source('silver_screen', 'nj_003') }}

),

renamed as (

    select
        DATE_TRUNC ('month',date) AS month,
        transaction_id,
        product_type,
        'NJ_003' AS location_id,
        ticket_amount,
        ticket_price,
        total_value

    from source

)

select * 
from renamed
where product_type = 'ticket'
