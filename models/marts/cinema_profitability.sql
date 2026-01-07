{{config (materialized='table')}}

SELECT 

    ir.movie_id,
    ir.movie_title,
    ir.genre,
    ir.studio,
    ir.month,
    ir.location_id, 
    ir.rental_cost, -- total rental costs for users per month for a movie, 
                                      --the monthly costs stay for raw over raw
    rt.transaction_month,

    -- Window Function: Sum of the tickets over all months per movie & location
    SUM (rt.tickets_sold) OVER (PARTITION BY ir.movie_id, ir.location_id 
    ORDER BY ir.month) 
    AS total_tickets_sold_per_location,

    -- Window Function: Total Revenue over all months per movie & Location
    SUM (rt.total_revenue) OVER (PARTITION BY ir.movie_id, ir.location_id 
    ORDER BY ir.month) 
    AS total_revenue_per_location

FROM {{ ref('int_rental_cost') }} ir
LEFT JOIN 
{{ ref('revenue_tickets_sold') }} rt
ON ir.movie_id = rt.movie_id
AND ir.month = rt.transaction_month -- also important to join for the month, key: Movie ID + Month
AND ir.location_id = rt.location_id
    
ORDER BY ir.movie_id, ir.month, ir.location_id

-- Warum das für deine Analyse perfekt ist:
-- Detaillierte Kosten: Du siehst genau, ob die Miete im zweiten oder dritten Monat gesunken oder gleich geblieben ist (basierend auf deinen invoices Daten).

-- Gesamt-Performance: Du musst nicht händisch rechnen, wie viele Tickets ein Film insgesamt an einem Standort verkauft hat; der Wert steht dank der Window Function in jeder Monatszeile dabei.

-- Vermeidung von Fehlern: Da du im JOIN weiterhin den Monat und die Location nutzt, stellst du sicher, dass die Datenbasis für die Berechnung absolut präzise ist und keine Dubletten entstehen.

-- Warum ist das Sortieren in der Function sinnvoll?
-- Entwicklung beobachten: Du siehst genau: "Im ersten Monat hatten wir 10.000 Tickets, im zweiten Monat sind wir insgesamt bei 18.000, im dritten bei 22.000."

-- Break-Even-Analyse: Du kannst direkt vergleichen, in welchem Monat die laufenden Einnahmen zum ersten Mal die laufenden Mietkosten überstiegen haben.

-- Trends: Du erkennst sofort, wann das Interesse an einem Film nachlässt (wenn die laufende Summe nur noch sehr langsam ansteigt).

