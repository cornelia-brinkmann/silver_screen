SELECT 
    movie_id,
    movie_title,
    COALESCE (genre, 'Unknown') AS genre_clean,
    studio
FROM {{ source('silver_screen', 'movies' )}}