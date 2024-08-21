-- Crear base de datos
CREATE DATABASE academy2;

USE academy2;

-- Crear tabla users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    user VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    role ENUM('admin', 'user') DEFAULT 'user'
);

-- Crear tabla courses
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    duracion VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    categoria VARCHAR(255) NOT NULL
);

-- Crear tabla user_course
CREATE TABLE user_course (
    user_id INT,
    course_id INT,
    PRIMARY KEY (user_id, course_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Insertar datos de ejemplo
INSERT INTO users (nombre, apellido, user, password, email, role) VALUES ('Admin', 'User', 'admin', 'password', 'admin@example.com', 'admin');
INSERT INTO users (nombre, apellido, user, password, email) VALUES ('User1', 'Example', 'user1', 'password', 'user1@example.com');
INSERT INTO users (nombre, apellido, user, password, email) VALUES ('User2', 'Example', 'user2', 'password', 'user2@example.com');

INSERT INTO courses (titulo, autor, duracion, descripcion, categoria) VALUES ('Curso 1', 'Autor 1', '10h', 'Descripción del curso 1', 'Categoría 1');
INSERT INTO courses (titulo, autor, duracion, descripcion, categoria) VALUES ('Curso 2', 'Autor 2', '8h', 'Descripción del curso 2', 'Categoría 2');
INSERT INTO courses (titulo, autor, duracion, descripcion, categoria) VALUES ('Curso 3', 'Autor 3', '15h', 'Descripción del curso 3', 'Categoría 3');
INSERT INTO courses (titulo, autor, duracion, descripcion, categoria) VALUES ('Curso 4', 'Autor 4', '12h', 'Descripción del curso 4', 'Categoría 4');
INSERT INTO courses (titulo, autor, duracion, descripcion, categoria) VALUES ('Curso 5', 'Autor 5', '9h', 'Descripción del curso 5', 'Categoría 5');
INSERT INTO courses (titulo, autor, duracion, descripcion, categoria) VALUES ('Curso 6', 'Autor 6', '11h', 'Descripción del curso 6', 'Categoría 6');
