SELECT
    artist.artist_name AS artista,
    disc.disc_name AS album
FROM artist
    INNER JOIN disc ON disc.artist_id = artist.artist_id
WHERE
    artist.artist_name = 'Elis Regina'
ORDER BY album;