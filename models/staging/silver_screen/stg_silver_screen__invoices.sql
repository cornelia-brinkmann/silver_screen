WITH source AS (
    
    SELECT 
        *
    FROM {{ source ('silver_screen', 'invoices') }}

),

renamed AS (

    SELECT

        {{dbt_utils.generate_surrogate_key (['movie_id', 'date', 'location_id', 'release_date'])}} AS id,
        movie_id,
        invoice_id,
        date AS month,
        location_id,
        studio,
        total_invoice_sum AS rental_cost
FROM source

),

final AS (
   SELECT 
        *,
        COUNT(*) OVER (PARTITION BY id) as id_count
    FROM renamed 
)

-- Wir behalten nur die Datensätze, die eindeutig sind
SELECT 
    id,
    movie_id,
    invoice_id,
    month,
    location_id,
    studio,
    rental_cost
FROM final
WHERE id_count = 1
