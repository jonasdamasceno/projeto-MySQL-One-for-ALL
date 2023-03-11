SELECT
    artist.artist_name AS artista,
    disc.disc_name AS album,
    COUNT(
        DISTINCT artist_followers.user_id
    ) AS pessoas_seguidoras
FROM disc
    INNER JOIN artist ON artist.artist_id = disc.artist_id
    INNER JOIN artist_followers ON artist_followers.artist_id = artist.artist_id
GROUP BY artista, album
ORDER BY
    pessoas_seguidoras DESC,
    artista,
    album;