SELECT
    music_name AS cancao,
    COUNT(*) AS reproducoes
FROM payback_history
    INNER JOIN music ON payback_history.music_id = music.music_id
GROUP BY
    payback_history.music_id
ORDER BY
    reproducoes DESC,
    cancao ASC
LIMIT 2;