WITH   duplicate_invoices AS(
select invoice_id
from {{ source("silver_screen", "invoices") }}
group by invoice_id
having COUNT(*) > 1
)
SELECT *
  FROM {{ source("silver_screen", "invoices") }}
WHERE invoice_id IN (SELECT * FROM duplicate_invoices)
ORDER BY invoice_id
