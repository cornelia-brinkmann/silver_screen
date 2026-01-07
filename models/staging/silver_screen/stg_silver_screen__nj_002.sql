with 

source as (

    select * from {{ source('silver_screen', 'nj_002') }}

),

renamed as (

    select
        DATE_TRUNC ('month', date) :: DATE AS transaction_month,
        COALESCE (movie_id, 'Unknown') AS movie_id,
        'NJ_002' AS location_id, -- Additional column for location
        COALESCE (ticket_amount, 0) AS tickets_sold,
        COALESCE (total_value, 0) AS revenue

    from source

)

select * from renamed