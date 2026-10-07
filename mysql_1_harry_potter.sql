-- ==========================================================================
-- HARRY POTTER (Students, Courses, Grades)  ->  base de datos: harry_potter
-- Motor: MySQL / MariaDB
-- ==========================================================================
-- COMO USARLO EN DATAGRIP
--   Opcion A (recomendada): clic derecho sobre la conexion > SQL Scripts >
--             Run SQL Script... > elegir este archivo.
--   Opcion B: abrir una consola (clic derecho > New > Query Console), pegar
--             todo, Ctrl+A y luego Ctrl+Enter.
--
-- Sirve igual para: MySQL local, MariaDB en Docker y MariaDB en Codespace.
-- Se puede ejecutar varias veces: cada vez deja la base en su estado inicial.
--
-- Tablas y datos: los de la Guia de Laboratorio (Actividades 1 y 2).
-- Unico cambio: TEXT -> VARCHAR, porque MySQL/MariaDB no deja indexar
-- columnas TEXT y la Actividad 5 pide crear un indice sobre Professor.
-- Los indices de la Actividad 5 NO estan incluidos (son parte del lab).
-- ==========================================================================

SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS harry_potter CHARACTER SET utf8mb4;
USE harry_potter;

-- Si las tablas ya existian se borran y se vuelven a crear (deja la base como nueva)
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Students;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Students (
    StudentID INTEGER PRIMARY KEY,
    Name      VARCHAR(100),
    House     VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID  INTEGER PRIMARY KEY,
    Name      VARCHAR(100),
    Professor VARCHAR(100)
);

CREATE TABLE Grades (
    StudentID INTEGER,
    CourseID  INTEGER,
    Grade     VARCHAR(2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID)  REFERENCES Courses(CourseID)
);

INSERT INTO Students (StudentID, Name, House) VALUES
    (1, 'Harry Potter', 'Gryffindor'),
    (2, 'Hermione Granger', 'Gryffindor'),
    (3, 'Draco Malfoy', 'Slytherin');

INSERT INTO Courses (CourseID, Name, Professor) VALUES
    (101, 'Potions', 'Severus Snape'),
    (102, 'Defense Against the Dark Arts', 'Remus Lupin'),
    (103, 'Herbology', 'Pomona Sprout');

INSERT INTO Grades (StudentID, CourseID, Grade) VALUES
    (1, 101, 'A'),
    (1, 102, 'E'),
    (2, 101, 'O'),
    (2, 103, 'O'),
    (3, 101, 'E'),
    (3, 102, 'A');

COMMIT;
