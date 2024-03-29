DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE
    plans(
        plans_id INT PRIMARY KEY AUTO_INCREMENT,
        plan_name VARCHAR(100) NOT NULL,
        price DECIMAL(5, 2) NOT NULL
    );

CREATE TABLE
    users (
        user_id INT PRIMARY KEY AUTO_INCREMENT,
        user_name VARCHAR(75) NOT NULL,
        signature_date DATE NOT NULL,
        user_age INT NOT NULL,
        plans_id INT NOT NULL,
        FOREIGN KEY (plans_id) REFERENCES plans(plans_id)
    );

CREATE TABLE
    artist (
        artist_id INT PRIMARY KEY AUTO_INCREMENT,
        artist_name VARCHAR(100) NOT NULL
    );

CREATE TABLE
    disc (
        disc_id INT PRIMARY KEY AUTO_INCREMENT,
        disc_name VARCHAR(100) NOT NULL,
        release_date YEAR NOT NULL,
        artist_id INT NOT NULL,
        FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
    );

CREATE TABLE
    music(
        music_id INT PRIMARY KEY AUTO_INCREMENT,
        music_name VARCHAR(100) NOT NULL,
        music_duration INT NOT NULL,
        disc_id INT NOT NULL,
        FOREIGN KEY (disc_id) REFERENCES disc(disc_id)
    );

CREATE TABLE
    artist_followers(
        user_id INT NOT NULL,
        artist_id INT NOT NULL,
        PRIMARY KEY (user_id, artist_id),
        FOREIGN KEY (user_id) REFERENCES users(user_id),
        FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
    );

CREATE TABLE
    payback_history (
        user_id INT NOT NULL,
        music_id INT NOT NULL,
        reproduction_date DATETIME NOT NULL,
        PRIMARY KEY (user_id, music_id),
        FOREIGN KEY (user_id) REFERENCES users(user_id),
        FOREIGN KEY (music_id) REFERENCES music(music_id)
    );

INSERT INTO
    plans (plan_name, price)
VALUES ('gratuito', 0.00), ('universitário', 5.99), ('pessoal', 6.99), ('familiar', 7.99);

INSERT INTO
    users (
        user_name,
        user_age,
        plans_id,
        signature_date
    )
VALUES (
        'Barbara Liskov',
        82,
        1,
        "2019-10-20"
    ), (
        'Robert Cecil Martin',
        58,
        1,
        "2017-01-06"
    ), (
        'Ada Lovelace',
        37,
        4,
        "2017-12-30"
    ), (
        'Martin Fowler',
        46,
        4,
        "2017-01-17"
    ), (
        'Sandi Metz',
        58,
        4,
        "2018-04-29"
    ), (
        'Paulo Freire',
        19,
        2,
        "2018-02-14"
    ), (
        'Bell Hooks',
        26,
        2,
        "2018-01-05"
    ), (
        'Christopher Alexander',
        85,
        3,
        "2019-06-05"
    ), (
        'Judith Butler',
        45,
        3,
        "2020-05-13"
    ), (
        'Jorge Amado',
        58,
        3,
        "2017-02-17"
    );

INSERT INTO
    artist (artist_name)
VALUES ('Beyoncé'), ('Queen'), ('Elis Regina'), ('Baco Exu do Blues'), ('Blind Guardian'), ('Nina Simone');

INSERT INTO
    disc ( disc_name, artist_id, release_date) VALUES 
    ('Renaissance', 1, 2022), 
    ('Jazz', 2, 1978), 
    ('Hot Space', 2, 1982), 
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001), 
    ('QVVJFA?', 4, 2003), 
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);

INSERT INTO
    music (
        music_name,
        disc_id,
        music_duration
    )
VALUES ('BREAK MY SOUL', 1, 279), ('VIRGO\'S GROOVE', 1, 369), ('ALIEN SUPERSTAR', 1, 116), ('Don\'t Stop Me Now', 2, 203), ('Under Pressure', 2, 152), ('Como Nossos Pais', 3, 105), (
        'O Medo de Amar é o Medo de Ser Livre',
        3,
        207
    ), ('Samba em Paris', 4, 267), ('The Bard\'s Song', 5, 244), ('Feeling Good', 6, 100);

INSERT INTO
    artist_followers (user_id, artist_id)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6), (6, 1), (6, 6), (7, 6), (9, 3), (10, 2);

INSERT INTO
    payback_history (
        user_id,
        music_id,
        reproduction_date
    )
VALUES (1, 8, "2022-02-28 10:45:55"), (1, 2, "2020-05-02 05:30:35"), (1, 10, "2020-03-06 11:22:33"), (2, 10, "2022-08-05 08:05:17"), (2, 7, "2020-01-02 07:40:33"), (3, 10, "2020-11-13 16:55:13"), (3, 2, "2020-12-05 18:38:30"), (4, 8, "2021-08-15 17:10:10"), (5, 8, "2022-01-09 01:44:33"), (5, 5, "2020-08-06 15:23:43"), (6, 7, "2017-01-24 00:31:17"), (6, 1, "2017-10-12 12:35:20"), (7, 4, "2011-12-15 22:30:49"), (8, 4, "2012-03-17 14:56:41"), (9, 9, "2022-02-24 21:14:22"), (10, 3, "2015-12-13 08:30:22");