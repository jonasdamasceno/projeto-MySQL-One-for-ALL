Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
CREATE TABLE plans(
    plans_id INT PRIMARY KEY AUTO_INTGREMENT,
    plan_name VARCHAR(75) NOT NULL, 
    price DECIMAL(5,2) NOT NULL,
) engine = InnoDB;
CREATE TABLE
    users(
        user_id INT PRIMARY KEY AUTO_INCREMENT,
        user_name VARCHAR(75) NOT NULL,
        user_age INT NOT NULL,
        plans_id INT NOT NULL,
        FOREIGN KEY (plans_id) REFERENCES plans(plans_id)
    ) engine = InnoDB;

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
INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados A'),
  ('exemplo de dados 2', 'exemplo de dados B'),
  ('exemplo de dados 3', 'exemplo de dados C');
INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
VALUES
  ('exemplo de dados 1', 'exemplo de dados X'),
  ('exemplo de dados 2', 'exemplo de dados Y');
