SELECT (
        SELECT COUNT(*)
        FROM music
    ) AS "cancoes", (
        SELECT COUNT(*)
        FROM artist
    ) AS "artistas", (
        SELECT COUNT(*)
        FROM disc
    ) AS "albuns";