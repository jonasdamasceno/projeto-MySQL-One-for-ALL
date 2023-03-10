SELECT
    u.user_name as pessoa_usuaria,
    IF(
        YEAR(MAX(histor.reproduction_date)) >= '2021',
        'Ativa',
        'Inativa'
    ) AS status_pessoa_usuaria
FROM users u
    JOIN payback_history histor ON histor.user_id = u.user_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;