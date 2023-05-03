DROP DATABASE IF EXISTS healthcare;
CREATE DATABASE healthcare;
USE healthcare;

DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS medicines;
DROP TABLE IF EXISTS doctors;
DROP TABLE IF EXISTS `condition`;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS diagnoses;

CREATE TABLE users (
	id_user BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(64) NOT NULL,
	email VARCHAR(128) NOT NULL,
	`password` VARCHAR(32) NOT NULL,
	gender CHAR(1) NOT NULL,
	country CHAR(3) NOT NULL,
	birth_date DATE NOT NULL,
	created_at DATETIME NOT NULL
);

CREATE TABLE medicines (
	id_medicine INT UNSIGNED NOT NULL AUTO_INCREMENT,
	medicament VARCHAR(192) NOT NULL,
	production_cost DECIMAL(9,2) NOT NULL,
	sell_cost DECIMAL(9,2) NOT NULL,
	PRIMARY KEY (id_medicine)
);

CREATE TABLE doctors (
	id_doctor INT UNSIGNED NOT NULL AUTO_INCREMENT,
	doctor VARCHAR(32) NOT NULL,
	PRIMARY KEY (id_doctor)
);

CREATE TABLE `condition` (
	id_condition INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`condition` VARCHAR(64) NOT NULL,
	symptoms TEXT NOT NULL,
	description TEXT NOT NULL,
	deadly BOOLEAN NOT NULL
);

CREATE TABLE diagnoses (
	id_diagnosis BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	diagnosis TEXT NOT NULL,
	id_doctor INT UNSIGNED NOT NULL,
	id_user BIGINT UNSIGNED NOT NULL,
	id_condition INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_doctor) REFERENCES doctors(id_doctor), 
	FOREIGN KEY (id_user) REFERENCES users(id_user),
	FOREIGN KEY (id_condition) REFERENCES `condition`(id_condition)
);

CREATE TABLE treatments (
	id_treatment BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_diagnosis BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (id_diagnosis) REFERENCES diagnoses(id_diagnosis)
);

INSERT INTO users (username, email, password, gender, country, birth_date, created_at)
VALUES
  	('root', 'mr.musgo@gmail.com', '95a6a7ebcb9a717b17c7a7f895de906c', 'M', 'ESP', '1985-12-12', NOW()),
  	('MaríaLópez', 'marialopez@example.com', 'password1', 'F', 'ESP', '1990-01-01', NOW()),
	('PedroSánchez', 'pedrosanchez@example.com', 'password2', 'M', 'ESP', '1995-05-05', NOW()),
	('AnaMartinez', 'anamartinez@example.com', 'password3', 'F', 'ESP', '1985-12-25', NOW());

INSERT INTO doctors (doctor)
VALUES
  	('Doctor Videla'),
  	('Doctora Ristol');

INSERT INTO medicines (medicament, production_cost, sell_cost)
VALUES
  	('Aspirina', 1.00, 3.00),
  	('Ibuprofeno', 2.00, 5.00),
  	('Paracetamol', 0.50, 2.50),
	('Amoxicilina', 3.00, 10.00);

INSERT INTO `condition` (`condition`, symptoms, description, deadly)
VALUES
  	('Gripe', 'Fiebre, tos, dolor de cabeza', 'Una enfermedad respiratoria común', 0),
  	('Diabetes', 'Aumento de la sed, micción frecuente', 'Un trastorno metabólico', 0),
  	('Cáncer', 'Pérdida de peso inexplicable, fatiga', 'Un grupo de enfermedades caracterizadas por el crecimiento anormal de células', 1),
	('Depresión', 'Sentirse triste o desesperanzado, pérdida de interés', 'Un trastorno del estado de ánimo', 0),
	('Anemia', 'Fatiga, debilidad, piel pálida', 'Una condición en la que no hay suficientes glóbulos rojos en el cuerpo', 0),
	('Presión arterial alta', 'Dolor de cabeza, visión borrosa', 'Una condición en la que la fuerza de la sangre contra las paredes de las arterias es demasiado alta', 0);

SELECT doctor FROM doctors WHERE id_doctor=1;
-- Output: Doctor Videla

SELECT doctor FROM doctors WHERE id_doctor=2;
-- Output: Doctora Ristol

SELECT condition, description FROM condition WHERE id_condition=1;
-- Output: Gripe | Una enfermedad respiratoria común

SELECT condition, description FROM condition WHERE id_condition=2;
-- Output: Diabetes | Un trastorno metabólico

SELECT condition, description FROM condition WHERE id_condition=3;
-- Output: Cáncer | Un grupo de enfermedades caracterizadas por el crecimiento anormal de células

SELECT condition, description FROM condition WHERE id_condition=4;
-- Output: Depresión | Un trastorno del estado de ánimo

SELECT condition, description FROM condition WHERE id_condition=5;
-- Output: Anemia | Una condición en la que no hay suficientes glóbulos rojos en el cuerpo

SELECT condition, description FROM condition WHERE id_condition=6;
-- Output: Presión arterial alta | Una condición en la que la fuerza de la sangre contra las paredes de las arterias es demasiado alta