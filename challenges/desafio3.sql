SELECT
    u.user_name as pessoa_usuaria,
    count(hist.music_id) as musicas_ouvidas,
    round(sum(s.music_duration) / 60, 2) as total_minutos
FROM users u
    JOIN payback_history hist ON u.user_id = hist.user_id
    JOIN music s ON hist.music_id = s.music_id
GROUP BY u.user_name
ORDER BY pessoa_usuaria;