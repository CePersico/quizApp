CREATE DATABASE capacitaciones;

USE capacitaciones;

CREATE TABLE IF NOT EXISTS cursos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  descripcion TEXT,
  duracion VARCHAR(50),
  autor VARCHAR(255),
  tema VARCHAR(255),
  enlace VARCHAR(255),
  img VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  apellido VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  telefono VARCHAR(20),
  documento VARCHAR(20),
  password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS user_courses (
  user_id INT,
  course_id INT,
  PRIMARY KEY (user_id, course_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (course_id) REFERENCES cursos(id) ON DELETE CASCADE
);



INSERT INTO users (nombre, apellido, email, telefono, documento, password) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', '3456789012', '34567890C', 'password123'),
('Ana', 'Martinez', 'ana.martinez@example.com', '4567890123', '45678901D', 'password123'),
('Pedro', 'Rodriguez', 'pedro.rodriguez@example.com', '5678901234', '56789012E', 'password123'),
('Laura', 'Garcia', 'laura.garcia@example.com', '6789012345', '67890123F', 'password123'),
('Luis', 'Fernandez', 'luis.fernandez@example.com', '7890123456', '78901234G', 'password123'),
('Elena', 'Sanchez', 'elena.sanchez@example.com', '8901234567', '89012345H', 'password123'),
('Jose', 'Hernandez', 'jose.hernandez@example.com', '9012345678', '90123456I', 'password123'),
('Isabel', 'Diaz', 'isabel.diaz@example.com', '0123456789', '01234567J', 'password123');


INSERT INTO users (nombre, apellido, email, telefono, documento, password) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', '3456789012', '34567890C', 'password123');

-- { "nombre": "Oriana", 
-- "apellido": "Persico", 
-- "documento": "Z0037677D", 
-- "email": "agnaligag@gmail.com", 
-- "telefono":"346875465" , 
-- "password":"contraseña" 
-- } 
INSERT INTO user_courses (user_id, course_id) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 5);

-- khbguyg
