--Pregunta 1: Crear una BD llamada "inventario" y una tabla llamada "equipo" con sus campos.
CREATE DATABASE inventario;


CREATE TABLE equipo(
id INT PRIMARY KEY IDENTITY (1,1),
marca CHAR(22) NOT NULL,
modelo CHAR(18) NOT NULL,
generacion INT NOT NULL,
anio INT NOT NULL,
costo REAL NOT NULL,
precioventa REAL NOT NULL,
cantidad REAL NOT NULL
);

--Pregunta 2: Insertar valores.
INSERT INTO equipo (marca, modelo, generacion, anio, costo, precioventa, cantidad)
VALUES ('HP', 'CF0003LA', 5, 2015, 190000, 300000, 15),
	   ('Acer', 'Aspire 3',6, 2016, 180000, 290000, 12),
	   ('HP', 'Envy', 6, 2017, 200000, 300000, 14),
	   ('Dell', 'Inspiron', 6, 2017, 220000, 320000, 17),
	   ('Dell', 'Vostro', 7, 2018, 250000, 380000, 5),
	   ('Acer', 'Aspire 5', 6, 2017, 190000, 300000, 4),
	   ('Lenovo', 'ThinkPad', 7, 2018, 200000, 310000, 19),
	   ('HP', '13-ab0004la', 7, 2018, 230000, 340000, 15),
	   ('Dell', 'Alienware', 7, 2018, 220000, 350000, 15),
	   ('Lenovo', 'IdeaPad', 5, 2015, 180000, 300000, 21);


--Pregunta 3: Consulta que actualice el campo cantidad sum�ndole 10 a los equipos de marca Dell del a�o 2018.
SELECT * FROM equipo;

UPDATE equipo
SET cantidad = cantidad + 10
WHERE (marca = 'Dell' and anio = 2018);

SELECT * FROM equipo;

--Pregunta 4: Consulta que muestre la marca, el modelo, el precio de venta y el costo de los equipos cuyo costo sea mayor a 200.000 y menor a 250.000.
SELECT marca, modelo, precioventa, costo
FROM equipo
WHERE costo > 200000 AND costo < 250000;


--Pregunta 5: Consulta que elimine el registro con la generaci�n m�s baja de la marca HP y Lenovo.
SELECT * FROM equipo;

DELETE FROM equipo 
WHERE generacion = (SELECT MIN(generacion) FROM equipo) and marca = 'HP' or generacion = (SELECT MIN(generacion) FROM equipo) and marca = 'Lenovo';

SELECT * FROM equipo;

--Pregunta 6: Consulta que muestre la marca y la suma de la cantidad de equipos.
SELECT marca, SUM(cantidad) AS cantidad_de_equipos_por_marca
FROM equipo
GROUP BY marca;

--Pregunta 7: Consulta que muestre la marca y la suma de la cantidad de equipos, con la condici�n de que muestre solo las marcas que tienen m�s de 20 equipos.
SELECT marca, SUM(cantidad) AS marcas_sobre_20_unidades
FROM equipo
GROUP BY marca 
HAVING SUM(cantidad) > 20;


--lineas extra para revisar como iba el avance.
TRUNCATE TABLE equipo;

SELECT * FROM equipo;