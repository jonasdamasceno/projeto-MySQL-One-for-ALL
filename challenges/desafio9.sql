SELECT
    COUNT(payback_history.music_id) AS musicas_no_historico
FROM payback_history
    INNER JOIN users ON user.user_id = payback_history.user_id
WHERE
    user.user_name = 'Barbara Liskov';