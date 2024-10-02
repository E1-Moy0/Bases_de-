CREATE DATABASE hospital;

USE hospital;

--CREAR TABLAS
CREATE TABLE Paciente (
	rut VARCHAR(10) NOT NULL PRIMARY KEY,
	nombre VARCHAR(45) NOT NULL,
	apellido VARCHAR(45)NOT NULL,
	edad INT NOT NULL,
	ingreso DATETIME NOT NULL
);

CREATE TABLE Visitas (
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	entrada DATETIME NOT NULL,
	salida DATETIME NOT NULL,
	Paciente_rut VARCHAR(10) FOREIGN KEY REFERENCES Paciente(rut)
);


CREATE TABLE Medico (
	rut VARCHAR(10) NOT NULL PRIMARY KEY,
	nombre VARCHAR(45) NOT NULL,
	apellido VARCHAR(45) NOT NULL
);

CREATE TABLE Diagnostico (
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(45) NOT NULL,
	descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE Atiende (
	Paciente_rut VARCHAR(10) FOREIGN KEY REFERENCES Paciente(rut),
	Medico_rut VARCHAR(10) FOREIGN KEY REFERENCES Medico(rut),
	fecha_atencion DATETIME NOT NULL,
	CONSTRAINT fk_pm PRIMARY KEY (Paciente_rut, Medico_rut)
);

CREATE TABLE Diagnosticar (
	Paciente_rut VARCHAR(10) FOREIGN KEY REFERENCES Paciente(rut),
	Diagnostico_id INT FOREIGN KEY REFERENCES diagnostico(id),
	Medico_rut VARCHAR(10) FOREIGN KEY REFERENCES Medico(rut),
	fecha_diagnostico DATETIME NOT NULL,
	CONSTRAINT fk_pdm PRIMARY KEY (Paciente_rut, Diagnostico_id, Medico_rut)
);

/*alter table diagnosticar
 alter column fecha_diagnostico datetime not null;

alter table diagnosticar
 add  PRIMARY KEY (paciente_rut, diagnostico_id, medico_rut);*/

-- POBLAR DATOS

--Ingresar 5 pacientes, todos en septiembre del 2022, pero distintos días
INSERT INTO Paciente VALUES ('19345645-6','Rafael','Vilches',20, '2022-09-10 10:30:00'),
				('18586853-k','Macarena','Poblete',39,'2022-09-11 11:45:00'), 
				('17546753-6','Ignacio','Zuzunaga',23,'2022-09-20 13:30:00'),
				('13104954-0','Gloria','Gonzalez',47,'2022-09-06 14:00:00'),
				('14005557-3','Mauricio','Concha',68,'2022-09-26 09:30:00');

--Ingresar entre 3 y 5 visitas por cada paciente
INSERT INTO Visitas (entrada, salida, Paciente_rut) VALUES ('2022-09-07 09:00:00','2022-09-07 09:15:00','13104954-0'),
		('2022-09-07 09:15:00','2022-09-07 09:30:00','13104954-0'),
		('2022-09-07 09:30:00','2022-09-07 09:45:00','13104954-0'),
		('2022-09-07 09:45:00','2022-09-07 10:00:00','13104954-0'),
		('2022-09-07 10:00:00','2022-09-07 10:15:00','13104954-0'),
		('2022-09-11 09:00:00','2022-09-11 09:15:00','19345645-6'),
		('2022-09-11 09:15:00','2022-09-11 09:30:00','19345645-6'),
		('2022-09-11 09:30:00','2022-09-11 09:45:00','19345645-6'),
		('2022-09-11 09:45:00','2022-09-11 10:00:00','19345645-6'),
		('2022-09-11 10:00:00','2022-09-11 10:15:00','19345645-6'),
		('2022-09-27 09:00:00','2022-09-27 09:15:00','14005557-3'),
		('2022-09-27 09:15:00','2022-09-27 09:30:00','14005557-3'),
		('2022-09-27 09:30:00','2022-09-27 09:45:00','14005557-3'),
		('2022-09-27 09:45:00','2022-09-27 10:00:00','14005557-3'),
		('2022-09-27 10:00:00','2022-09-27 10:15:00','14005557-3'),
		('2022-09-21 09:00:00','2022-09-21 09:15:00','17546753-6'),
		('2022-09-21 09:15:00','2022-09-21 09:30:00','17546753-6'),
		('2022-09-21 09:30:00','2022-09-21 09:45:00','17546753-6'),
		('2022-09-21 09:45:00','2022-09-21 10:00:00','17546753-6'),
		('2022-09-21 10:00:00','2022-09-21 10:15:00','17546753-6'),
		('2022-09-12 09:00:00','2022-09-12 09:15:00','18586853-k'),
		('2022-09-12 09:15:00','2022-09-12 09:30:00','18586853-k'),
		('2022-09-12 09:30:00','2022-09-12 09:45:00','18586853-k'),
		('2022-09-12 09:45:00','2022-09-12 10:00:00','18586853-k'),
		('2022-09-12 10:00:00','2022-09-12 10:15:00','18586853-k');

--Ingresar 3 medicos
INSERT INTO Medico VALUES ('11357346_7','Juan','Saavedra'), 
				('10330556-2','Francisco','Freire'),
				('11467356-k','Daniela','Zuñiga');

--Ingresar 7 diagnosticos
INSERT INTO diagnostico (nombre, descripcion) VALUES ('Bronquitis Aguda', 'Tos, Mucosidad'), 
					('Resfriado Comun','Estornudos, Cosgestion Nasal, Dolor de Garganta, Tos'),
					('Infeccion de Oido','Dolor de Oido, Fiebre'),
					('Influenza','Fiebre, Tos, Dolor de Garganta, Congestion Nasal, Dolores Corporales'),
					('Sinusitis','Dolor de Cabeza, Congestion Nasal, Presion en la Cara'),
					('Infecciones de la Piel','Enrojecimiento de la Piel, Inflamacion del Area Afectada'),
					('Infeccion Urinaria','Dolor al Orinar, Necesidad de Orinar con Frecuencia');

--Ingresar 1 o 2 atenciones por paciente
INSERT INTO Atiende	VALUES ('19345645-6','11357346_7','2022-09-10 10:00:00'),('19345645-6','10330556-2','2022-09-10 10:15:00'),
					('18586853-k','10330556-2','2022-09-11 11:15:00'), ('18586853-k','11467356-k','2022-09-11 11:30:00'),
					('17546753-6','11357346_7','2022-09-20 13:00:00'),('17546753-6','10330556-2','2022-09-20 13:15:00'),
					('13104954-0','11357346_7','2022-09-06 13:30:00'), ('13104954-0','11467356-k','2022-09-06 13:45:00'),
					('14005557-3','10330556-2','2022-09-26 09:00:00'),('14005557-3','11357346_7','2022-09-26 09:15:00');

--Ingresar entre 1 y 3 diagnosticos para cada paciente
INSERT INTO Diagnosticar VALUES ('19345645-6',2,'11357346_7','2022-09-10 10:25:00'),('19345645-6',1,'11357346_7','2022-09-10 10:27:00'),
			('18586853-k',5,'11467356-k','2022-09-11 11:40:00'),('18586853-k',3,'11467356-k','2022-09-11 11:43:00'),
			('17546753-6',6,'10330556-2','2022-09-20 13:25:00'),('17546753-6',7,'10330556-2','2022-09-20 13:27:00'),
			('13104954-0',4,'11357346_7','2022-09-06 13:55:00'),('13104954-0',6,'11357346_7','2022-09-06 13:57:00'),
			('14005557-3',2,'10330556-2','2022-09-26 09:25:00'),('14005557-3',5,'10330556-2','2022-09-26 09:27:00');