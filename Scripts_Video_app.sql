-- Crear la base de datos
CREATE DATABASE videoApp;

-- Usar la base de datos
USE videoApp;

-- Crear la tabla de usuarios
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Crear la tabla de videos
CREATE TABLE videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    uploadedBy INT,
    FOREIGN KEY (uploadedBy) REFERENCES users(id)
);

INSERT INTO users (username, password) VALUES ('user1', '$2a$10$x9g4p4MrbM13cSqkBshKKeHM2xJ8K7KIVijEhShKK3cMT/eDLktWq');
INSERT INTO users (username, password) VALUES ('user2', '$2a$10$4rMGd6.rWEaqfucrSDSipe09ILrHJpg.lMQlMmSJ4BESCQmQIJt.O');


-- Insertar videos
INSERT INTO videos (title, url, uploadedBy) VALUES ('Curso 1', 'https://www.youtube.com/watch?v=videoId1', 1);
INSERT INTO videos (title, url, uploadedBy) VALUES ('Curso 2', 'https://www.youtube.com/watch?v=videoId2', 1);
INSERT INTO videos (title, url, uploadedBy) VALUES ('Curso 3', 'https://www.youtube.com/watch?v=videoId3', 2);
INSERT INTO videos (title, url, uploadedBy) VALUES ('Curso 4', 'https://www.youtube.com/watch?v=videoId4', 2);
INSERT INTO videos (title, url, uploadedBy) VALUES ('Curso 7', '<iframe width="560" height="315" src="https://www.youtube.com/embed/xaETuMLbvWs?si=RJXH8kkggsAj2gti&amp;controls=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>', 2);
