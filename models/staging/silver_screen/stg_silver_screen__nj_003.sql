with 

source as (

    select * from {{ source('silver_screen', 'nj_003') }}

),

renamed as (

    select
        DATE_TRUNC ('month',date) :: DATE AS transaction_month,
        COALESCE (movie_id, 'Unknown') AS movie_id,-- details in raw tabele has the information movie_id for tickets
        'NJ_003' AS location_id, -- additional column for location
        COALESCE (ticket_amount, 0) AS tickets_sold,
        COALESCE (total_value, 0) AS revenue

    from source
    where product_type = 'ticket' -- only total_value for tickets, not snacks or drinks etc.
)

select * 
from renamed

