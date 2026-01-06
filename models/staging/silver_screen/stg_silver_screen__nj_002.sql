with 

source as (

    select * from {{ source('silver_screen', 'nj_002') }}

),

renamed as (

    select
        DATE_TRUNC ('month', date) AS month,
        movie_id,
        'NJ_002' AS location_id,
        ticket_amount,
        ticket_price,
        total_value

    from source

)

select * from renamed