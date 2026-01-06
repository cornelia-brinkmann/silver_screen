with 

source as (

    select * from {{ source('silver_screen', 'nj_002') }}

),

renamed as (

    select
        DATE_TRUNC ('month', date) :: DATE AS month,
        'Unknown' AS transaction_id, -- For missing column transaction_id
        COALESCE (movie_id, 'Unknown') AS movie_id,
        'NJ_002' AS location_id, -- Additional column for location
        COALESCE (ticket_amount, 0) AS ticket_amount,
        COALESCE (ticket_price, 0) AS ticket_price,
        COALESCE (total_value, 0) AS total_value

    from source

)

select * from renamed