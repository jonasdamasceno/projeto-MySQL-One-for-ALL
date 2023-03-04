
DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;
  CREATE TABLE plans(
    plans_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(100) NOT NULL,
    price DECIMAL(5,2) NOT NULL
  );
  CREATE TABLE users (
        user_id INT PRIMARY KEY AUTO_INCREMENT,
        user_name VARCHAR(75) NOT NULL,
        user_age INT NOT NULL,
        plans_id INT NOT NULL,
        FOREIGN KEY (plans_id) REFERENCES plans(plans_id)
    );

    CREATE TABLE artist (
      artist_id INT PRIMARY KEY AUTO_INCREMENT, 
      artist_name VARCHAR(100) NOT NULL,
    );

    CREATE TABLE disc (
      disc_id INT PRIMARY KEY AUTO_INCREMENT,
      disc_name VARCHAR(100) NOT NULL,
      artist_id INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
    );

    CREATE TABLE music(
      music_id INT PRIMARY KEY AUTO_INCREMENT,
      music_name VARCHAR(100) NOT NULL,
      disc_id INT NOT NULL,
    FOREIGN KEY (disc_id) REFERENCES disc(disc_id)
    );

    CREATE TABLE artist_followers(
        user_id INT NOT NULL,
        artist_id INT NOT NULL,
        PRIMARY KEY (user_id, artist_id),
        FOREIGN KEY (user_id) REFERENCES users(user_id),
        FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
    );

    CREATE TABLE payback_history (
        user_id INT NOT NULL,
        music_id INT NOT NULL,
        PRIMARY KEY (user_id, music_id),
        FOREIGN KEY (user_id) REFERENCES users(user_id),
        FOREIGN KEY (music_id) REFERENCES music(music_id)
    );
    INSERT INTO plans (plan_name, price)
VALUES ('gratuito', 0.00), ('universitário', 5.99), ('pessoal', 6.99), ('familiar', 7.99);

    INSERT INTO users (user_name, user_age, plans_id) VALUES 
    ('Barbara Liskov', 82, 1), 
    ('Robert Cecil Martin', 58, 1), 
    ('Ada Lovelace', 37, 4), 
    ('Martin Fowler', 46, 4), 
    ('Sandi Metz', 58, 4), 
    ('Paulo Freire', 19, 2), 
    ('Bell Hooks', 26, 2), 
    ('Christopher Alexander', 85, 3), 
    ('Judith Butler', 45, 3), 
    ('Jorge Amado', 58, 3);

    INSERT INTO artist (artist_name) VALUES
    ('Beyoncé'), ('Queen'), ('Elis Regina'), ('Baco Exu do Blues'), ('Blind Guardian'), ('Nina Simone');

    INSERT INTO disc (disc_name, artist_id) VALUES
    ('Renaissance', 1), 
    ('Jazz', 2), 
    ('Hot Space', 2), 
    ('Falso Brilhante', 3), 
    ('Vento de Maio', 3), 
    ('QVVJFA?', 4), 
    ('Somewhere Far Beyond', 5), 
    ('I Put A Spell On You', 6);

    INSERT INTO music (music_name, disc_id) VALUES 
    ('BREAK MY SOUL', 1), 
    ('VIRGO\'S GROOVE', 1), 
    ('ALIEN SUPERSTAR', 1), 
    ('Don\'t Stop Me Now', 2), 
    ('Under Pressure', 2), 
    ('Como Nossos Pais', 3), 
    ('O Medo de Amar é o Medo de Ser Livre', 3), 
    ('Samba em Paris', 4), 
    ('The Bard\'s Song', 5), 
    ('Feeling Good', 6);

INSERT INTO artist_followers (user_id, artist_id) VALUES 
    (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6), (6, 1), (6, 6), (7, 6), (9, 3), (10, 2);

INSERT INTO payback_history (user_id, music_id) VALUES 
(1, 8), (1, 2), (1, 10), (2, 10), (2, 7), (3, 10), (3, 2), (4, 8), (5, 8), (5, 5), (6, 7), (6, 1), (7, 4), (8, 4), (9, 9), (10, 3);