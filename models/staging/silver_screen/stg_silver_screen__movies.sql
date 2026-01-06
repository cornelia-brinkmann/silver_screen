SELECT 
    movie_id,
    movie_title,
    COALESCE (genre, 'Unknown') AS genre_clean, --Fehlende Werte mit Unknown ergänzt
    studio
FROM {{ source('silver_screen', 'movies' )}}