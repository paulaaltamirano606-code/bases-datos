-- ==========================================================================
-- MARINEROS (Sailors, Boats, Reserves)  ->  base de datos: marineros
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
-- Tablas y datos: los del Laboratorio Marineros (Actividades 1 y 2).
-- Unico cambio: TEXT -> VARCHAR, porque MySQL/MariaDB no deja indexar
-- columnas TEXT y la Actividad 5 pide crear un indice sobre color.
-- Los indices de la Actividad 5 NO estan incluidos (son parte del lab).
-- ==========================================================================

SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS marineros CHARACTER SET utf8mb4;
USE marineros;

-- Si las tablas ya existian se borran y se vuelven a crear (deja la base como nueva)
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Reserves;
DROP TABLE IF EXISTS Boats;
DROP TABLE IF EXISTS Sailors;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Sailors (
    sid    INTEGER PRIMARY KEY,
    sname  VARCHAR(100),
    rating INTEGER,
    age    REAL
);

CREATE TABLE Boats (
    bid   INTEGER PRIMARY KEY,
    bname VARCHAR(100),
    color VARCHAR(50)
);

CREATE TABLE Reserves (
    sid INTEGER,
    bid INTEGER,
    day DATE,
    PRIMARY KEY (sid, bid, day),
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);

INSERT INTO Sailors (sid, sname, rating, age) VALUES
    (22, 'Dustin', 7, 45),
    (31, 'Lubber', 8, 55.5),
    (58, 'Rusty', 10, 35);

INSERT INTO Boats (bid, bname, color) VALUES
    (101, 'Interlake', 'blue'),
    (102, 'Clipper', 'red'),
    (103, 'Marine', 'green');

INSERT INTO Reserves (sid, bid, day) VALUES
    (22, 101, '2023-07-10'),
    (22, 102, '2023-08-15'),
    (31, 103, '2023-09-10'),
    (58, 101, '2023-10-05');

COMMIT;
