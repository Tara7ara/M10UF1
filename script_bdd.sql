DROP DATABASE IF EXISTS EvilCorp;
CREATE DATABASE EvilCorp;
USE EvilCorp;

-- TODOS LOS DROPS DE LA TABLA
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS medicines;
DROP TABLE IF EXISTS conditions;
DROP TABLE IF EXISTS diagnoses;
DROP TABLE IF EXISTS treatments;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS streets_numbers;
DROP TABLE IF EXISTS staircases;
DROP TABLE IF EXISTS floors;
DROP TABLE IF EXISTS doors;
DROP TABLE IF EXISTS zip_codes;
DROP TABLE IF EXISTS planet;
DROP TABLE IF EXISTS users_cosp;
DROP TABLE IF EXISTS cosp;
DROP TABLE IF EXISTS iluminatis;
DROP TABLE IF EXISTS civilizations;
DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS doctors;


-- TODAS LAS TABLAS DE BBD
CREATE TABLE users (
id_user INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
username       VARCHAR(50)  NOT NULL,
password       VARCHAR(32)  NOT NULL,
password_hash_md5  VARCHAR(128) NOT NULL,
first_name     VARCHAR(50)  NOT NULL,
last_name      VARCHAR(50)  NOT NULL,
email          VARCHAR(100) NOT NULL,
date_of_birth  DATE         NOT NULL,
dead BOOLEAN DEFAULT false
);
CREATE TABLE medicines(
id_medicine INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
medicine VARCHAR(192) NOT NULL,
cost	DECIMAL(9,2) NOT NULL,
price	DECIMAL(9,2)NOT NULL
);
CREATE TABLE doctors (
id_doctor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
doctor VARCHAR(32)
);
CREATE TABLE conditions (
id_condition INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
condicion VARCHAR(64) NOT NULL,
symptoms TEXT,
description TEXT,
deadly BOOL
);
CREATE TABLE diagnoses(
id_diagnosis BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
diagnosis 	TEXT  NOT NULL,
datetime	DATETIME  NOT NULL,
id_doctor	INT UNSIGNED,
id_user		INT UNSIGNED,
id_condition	INT UNSIGNED,
FOREIGN KEY (id_doctor) REFERENCES doctors(id_doctor),
FOREIGN KEY (id_user) REFERENCES users(id_user),
FOREIGN KEY (id_condition) REFERENCES conditions(id_condition)
);
CREATE TABLE treatments (
id_treatment INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
id_condition INT UNSIGNED NOT NULL,
id_diagnosis BIGINT UNSIGNED,
id_medicine  INT UNSIGNED NOT NULL,
FOREIGN KEY (id_condition) REFERENCES conditions(id_condition),
FOREIGN KEY (id_diagnosis) REFERENCES diagnoses(id_diagnosis),
FOREIGN KEY (id_medicine) REFERENCES medicines(id_medicine)
);
CREATE TABLE countries (
id_country INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
country VARCHAR(64)
);
CREATE TABLE cities(
id_city INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
city VARCHAR(64),
id_country INT UNSIGNED,
FOREIGN KEY (id_country) REFERENCES countries(id_country)
);
CREATE TABLE streets(
id_street INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
street VARCHAR(64),
id_city INT UNSIGNED,
FOREIGN KEY (id_city) REFERENCES cities(id_city)
);
CREATE TABLE streets_numbers(
id_street_number INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
street_number VARCHAR(32)
);
CREATE TABLE staircases(
id_staircase INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
staircase VARCHAR(32)
);
CREATE TABLE floors(
id_floor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
`floor` VARCHAR(32)
);
CREATE TABLE doors(
id_door INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
door VARCHAR(32)
);
CREATE TABLE zip_codes(
id_zip_code INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
zip_code VARCHAR(32)
);
CREATE TABLE addresses(
  id_address INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_street INT UNSIGNED,
  id_street_number INT UNSIGNED,
  id_staircase INT UNSIGNED,
  id_floor INT UNSIGNED,
  id_door INT UNSIGNED,
  id_zip_code INT UNSIGNED,
  FOREIGN KEY (id_street) REFERENCES streets(id_street),
  FOREIGN KEY (id_street_number) REFERENCES streets_numbers(id_street_number),
  FOREIGN KEY (id_staircase) REFERENCES staircases(id_staircase),
  FOREIGN KEY (id_floor) REFERENCES floors(id_floor),
  FOREIGN KEY (id_door) REFERENCES doors(id_door),
  FOREIGN KEY (id_zip_code) REFERENCES zip_codes(id_zip_code)
);
ALTER TABLE addresses ADD COLUMN id_planet INT UNSIGNED;
ALTER TABLE addresses ADD FOREIGN KEY (id_planet) REFERENCES planet(id_planet);
CREATE TABLE planet (
  id_planet INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  planet VARCHAR(64) NOT NULL
);
ALTER TABLE countries ADD COLUMN id_planet INT UNSIGNED NOT NULL AFTER id_country;
ALTER TABLE countries ADD FOREIGN KEY (id_planet) REFERENCES planet(id_planet);
CREATE TABLE users_cosp (
  	id_user_cosp INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_user INT UNSIGNED
);
CREATE TABLE cosp (
        id_cosp INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
        id_user_cosp INT UNSIGNED
);
CREATE TABLE civilizations (
	id INT PRIMARY KEY,
	name VARCHAR(50),
	planet VARCHAR(50),
	dead BOOLEAN DEFAULT false
);

-- TODOS LOS INSERTS
INSERT INTO users (username, password, password_hash_md5, first_name, last_name, email, date_of_birth) VALUES ('user1', 'password1', 'password_hash_md5_1', 'John', 'Doe', 'johndoe@example.com', '1990-01-01');
INSERT INTO users (username, password, password_hash_md5, first_name, last_name, email, date_of_birth) VALUES ('user2', 'password2', 'password_hash_md5_2', 'Jane', 'Doe', 'janedoe@example.com', '1990-01-02');
INSERT INTO users (username, password, password_hash_md5, first_name, last_name, email, date_of_birth) VALUES ('user3', 'password3', 'password_hash_md5_3', 'Bob', 'Smith', 'bobsmith@example.com', '1990-01-03');
INSERT INTO doctors (doctor) VALUES ('Dr. John Doe');
INSERT INTO doctors (doctor) VALUES ('Dr. Jane Doe');
INSERT INTO medicines (medicine,cost,price) VALUES ('Medicine A', 10.00 , 20.00);
INSERT INTO medicines (medicine,cost,price) VALUES ('Medicine B', 20.00 , 30.00);
INSERT INTO medicines (medicine,cost,price) VALUES ('Medicine C', 30.00 , 40.00);
INSERT INTO medicines (medicine,cost,price) VALUES ('Medicine D', 40.00 , 50.00);
INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition A','Symptom A','Description A',false);
INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition B','Symptom B','Description B',true);
INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition C','Symptom C','Description C',false);
INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition D','Symptom D','Description D',true);
INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition E','Symptom E','Description E',false);
INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition F','Symptom F','Description F',true);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition)  VALUES ('Cagarrinas', '2023-05-03 13:00:00', 1, 1, 1);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition)  VALUES ('Cancer', '2023-05-03 13:00:00', 1, 1, 1);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition)  VALUES ('Fimosis', '2023-05-03 13:00:00', 1, 1, 1);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition)  VALUES ('Gripe alonistican', '2023-05-03 13:00:00', 1, 1, 1);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine)  VALUES (1, 1, 1);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine)  VALUES (1, 1, 1);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine)  VALUES (1, 1, 1);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine)  VALUES (1, 1, 1);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine)  VALUES (1, 1, 1);
INSERT INTO planet (planet) VALUES ('Earth');
INSERT INTO planet (planet) VALUES ('Mars');
INSERT INTO planet (planet) VALUES ('Venus');
INSERT INTO countries (country, id_planet) VALUES ('Spain', 1);
INSERT INTO countries (country, id_planet) VALUES ('USA', 1);
INSERT INTO countries (country, id_planet) VALUES ('China', 1);
INSERT INTO countries (country, id_planet) VALUES ('Mars', 2);
INSERT INTO countries (country, id_planet) VALUES ('Venus', 3);
INSERT INTO cities (city, id_country) VALUES ('Madrid', 1);
INSERT INTO cities (city, id_country) VALUES ('New York', 2);
INSERT INTO cities (city, id_country) VALUES ('Beijing', 3);
INSERT INTO cities (city, id_country) VALUES ('Mars City', 4);
INSERT INTO cities (city, id_country) VALUES ('Venus City', 5);
INSERT INTO users (username, password, password_hash_md5, first_name, last_name, email, date_of_birth) VALUES ('jlopez', '123456', 'e10adc3949ba59abbe56e057f20f883e', 'Juan', 'López', 'jlopez@example.com', '1990-05-15');
INSERT INTO users (username, password, password_hash_md5, first_name, last_name, email, date_of_birth) VALUES ('mrodriguez', 'password123', '482c811da5d5b4bc6d497ffa98491e38', 'María', 'Rodríguez', 'mrodriguez@example.com', '1985-09-23');
INSERT INTO users (username, password, password_hash_md5, first_name, last_name, email, date_of_birth) VALUES ('jgarcia', 'securepass', 'bd7c8f4eb61f465442b30b47d3f6a70b', 'José', 'García', 'jgarcia@example.com', '1992-11-01');
INSERT INTO users (username, password, password_hash_md5, first_name, last_name, email, date_of_birth) VALUES ('acruz', 'pass1234', '81dc9bdb52d04dc20036dbd8313ed055', 'Ana', 'Cruz', 'acruz@example.com', '1988-07-07');
INSERT INTO users (username, password, password_hash_md5, first_name, last_name, email, date_of_birth) VALUES ('pmartinez', 'qwerty', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'Pedro', 'Martínez', 'pmartinez@example.com', '1994-03-12');
INSERT INTO medicines (medicine, cost, price) VALUES ('Paracetamol', 5.50, 8.99);
INSERT INTO medicines (medicine, cost, price) VALUES ('Ibuprofeno', 7.80, 12.50);
INSERT INTO medicines (medicine, cost, price) VALUES ('Omeprazol', 10.20, 15.99);
INSERT INTO medicines (medicine, cost, price) VALUES ('Amoxicilina', 6.75, 9.99);
INSERT INTO medicines (medicine, cost, price) VALUES ('Diazepam', 8.30, 13.50);
INSERT INTO doctors (doctor) VALUES ('Dr. Pérez');
INSERT INTO doctors (doctor) VALUES ('Dr. García');
INSERT INTO doctors (doctor) VALUES ('Dr. Rodríguez');
INSERT INTO doctors (doctor) VALUES ('Dr. Martínez');
INSERT INTO doctors (doctor) VALUES ('Dr. López');
INSERT INTO conditions (condicion, symptoms, description, deadly) VALUES ('Gripe', 'Fiebre, dolor de cabeza, congestión nasal', 'La gripe es una enfermedad viral que afecta las vías respiratorias.', false);
INSERT INTO conditions (condicion, symptoms, description, deadly) VALUES ('Diabetes', 'Pérdida de peso, sed excesiva, micción frecuente', 'La diabetes es una enfermedad crónica que se caracteriza por altos niveles de glucosa en la sangre.', false);
INSERT INTO conditions (condicion, symptoms, description, deadly) VALUES ('Diabetes 2', 'Pérdida de peso, sed excesiva, micción frecuente', 'Diabetes tipo 2 es la forma más común de diabetes y se desarrolla cuando el cuerpo no produce suficiente insulina o no la utiliza adecuadamente.', false);
INSERT INTO conditions (condicion, symptoms, description, deadly) VALUES ('Hipertensión', 'Presión arterial alta, dolor de cabeza, mareos', 'La hipertensión es una enfermedad crónica que se caracteriza por tener una presión arterial elevada.', false);
INSERT INTO conditions (condicion, symptoms, description, deadly) VALUES ('Asma', 'Dificultad para respirar, sibilancias, tos', 'El asma es una enfermedad crónica que afecta las vías respiratorias y provoca dificultad para respirar.', false);
INSERT INTO conditions (condicion, symptoms, description, deadly) VALUES ('Cáncer de mama', 'Bulto en el seno, cambios en la piel del seno, secreción del pezón', 'El cáncer de mama es un tumor maligno que se origina en las células de la mama.', true);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) VALUES ('Gripe común', NOW(), 1, 1, 1);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) VALUES ('Diabetes tipo 2', NOW(), 2, 2, 2);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) VALUES ('Hipertensión arterial', NOW(), 3, 3, 3);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) VALUES ('Asma crónica', NOW(), 4, 4, 4);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) VALUES ('Cáncer de mama en etapa avanzada', NOW(), 5, 5, 5);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine) VALUES (1, 1, 1);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine) VALUES (2, 2, 3);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine) VALUES (3, 3, 2);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine) VALUES (4, 4, 4);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine) VALUES (5, 5, 5);
INSERT INTO countries (country, id_planet) VALUES ('España', 1);
INSERT INTO countries (country, id_planet) VALUES ('México', 1);
INSERT INTO countries (country, id_planet) VALUES ('Argentina', 1);
INSERT INTO countries (country, id_planet) VALUES ('Colombia', 1);
INSERT INTO countries (country, id_planet) VALUES ('Perú', 1);
INSERT INTO cities (city, id_country) VALUES ('Madrid', 1);
INSERT INTO cities (city, id_country) VALUES ('México DF', 2);
INSERT INTO cities (city, id_country) VALUES ('Buenos Aires', 3);
INSERT INTO cities (city, id_country) VALUES ('Bogotá', 4);
INSERT INTO cities (city, id_country) VALUES ('Lima', 5);
INSERT INTO streets (street, id_city) VALUES ('Calle Mayor', 1);
INSERT INTO streets (street, id_city) VALUES ('Avenida Reforma', 2);
INSERT INTO streets (street, id_city) VALUES ('Calle Florida', 3);
INSERT INTO streets (street, id_city) VALUES ('Carrera 7', 4);
INSERT INTO streets (street, id_city) VALUES ('Avenida Tacna', 5);
INSERT INTO streets_numbers (street_number) VALUES ('123');
INSERT INTO streets_numbers (street_number) VALUES ('456');
INSERT INTO streets_numbers (street_number) VALUES ('789');
INSERT INTO streets_numbers (street_number) VALUES ('102');
INSERT INTO streets_numbers (street_number) VALUES ('345');
INSERT INTO staircases (staircase) VALUES ('A');
INSERT INTO staircases (staircase) VALUES ('B');
INSERT INTO staircases (staircase) VALUES ('C');
INSERT INTO staircases (staircase) VALUES ('D');
INSERT INTO staircases (staircase) VALUES ('E');
INSERT INTO floors (`floor`) VALUES ('1');
INSERT INTO floors (`floor`) VALUES ('2');
INSERT INTO floors (`floor`) VALUES ('3');
INSERT INTO floors (`floor`) VALUES ('4');
INSERT INTO floors (`floor`) VALUES ('5');
INSERT INTO doors (door) VALUES ('A');
INSERT INTO doors (door) VALUES ('B');
INSERT INTO doors (door) VALUES ('C');
INSERT INTO doors (door) VALUES ('D');
INSERT INTO doors (door) VALUES ('E');
INSERT INTO zip_codes (zip_code) VALUES ('28001');
INSERT INTO zip_codes (zip_code) VALUES ('06600');
INSERT INTO zip_codes (zip_code) VALUES ('1005');
INSERT INTO zip_codes (zip_code) VALUES ('110231');
INSERT INTO zip_codes (zip_code) VALUES ('15082');
INSERT INTO planet (planet) VALUES ('Tierra');
INSERT INTO planet (planet) VALUES ('Marte');
INSERT INTO planet (planet) VALUES ('Venus');
INSERT INTO planet (planet) VALUES ('Júpiter');
INSERT INTO planet (planet) VALUES ('Saturno');
INSERT INTO users_cosp (id_user) VALUES (1);
INSERT INTO users_cosp (id_user) VALUES (2);
INSERT INTO users_cosp (id_user) VALUES (3);
INSERT INTO users_cosp (id_user) VALUES (4);
INSERT INTO users_cosp (id_user) VALUES (5);
INSERT INTO cosp (id_user_cosp) VALUES (1);
INSERT INTO cosp (id_user_cosp) VALUES (2);
INSERT INTO cosp (id_user_cosp) VALUES (3);
INSERT INTO cosp (id_user_cosp) VALUES (4);
INSERT INTO cosp (id_user_cosp) VALUES (5);
INSERT INTO civilizations (id, name, planet) VALUES (1, 'Atlantis', 'Tierra');
INSERT INTO civilizations (id, name, planet) VALUES (2, 'Lemuria', 'Tierra');
INSERT INTO civilizations (id, name, planet) VALUES (3, 'Omicron Persei 8', 'Marte');
INSERT INTO civilizations (id, name, planet) VALUES (4, 'Zog', 'Marte');
INSERT INTO civilizations (id, name, planet) VALUES (5, 'Asgard', 'Tierra');

-- TODAS LAS VIEWS
DROP VIEW IF EXISTS contador_de_personas;
DROP VIEW IF EXISTS beneficios_por_planeta;
DROP VIEW IF EXISTS planet_address_count;
DROP VIEW IF EXISTS coste_total;
DROP VIEW IF EXISTS usuarios_iluminatis;
DROP VIEW IF EXISTS cantidad_iluminatis;

CREATE VIEW contador_de_personas AS
SELECT planet, COUNT(*) AS count
FROM civilizations
GROUP BY planet;
CREATE VIEW beneficios_por_planeta AS
SELECT SUM(price - cost) AS beneficios
FROM medicines;
--CREATE VIEW usuarios_iluminatis AS
--SELECT user.id_user, user.username, user.email, user.gender, user.country, user.birth_date, user.created_at
--FROM users user
--JOIN iluminatis i ON user.id_user = iluminatis.id_user;
--CREATE VIEW cantidad_iluminatis AS
--SELECT COUNT(*) AS cantidad_iluminatis
--FROM iluminatis;
--CREATE VIEW planet_address_count AS
--SELECT planet.planet, COUNT(addresses.id_address) AS address_count
--FROM planet
--CREATE VIEW coste_total AS
--SELECT SUM(coste_produccion) as sumatorio_total FROM produccion_medicamentos;
--SELECT * FROM coste_total;


-- Funciones creadas en clase

DELIMITER //

CREATE FUNCTION get_city(planet VARCHAR(64), country VARCHAR(64), city VARCHAR(64)) RETURNS INT
BEGIN
DECLARE id_planet INT UNSIGNED;
DECLARE id_country INT UNSIGNED;
DECLARE id_city INT UNSIGNED;

SELECT id_planet INTO id_planet FROM planet WHERE planet = planet LIMIT 1;

IF id_planet IS NULL THEN
INSERT INTO planet (planet) VALUES (planet);
SET id_planet = LAST_INSERT_ID();
END IF;

SELECT id_country INTO id_country FROM countries WHERE country = country AND id_planet = id_planet LIMIT 1;
IF id_country IS NULL THEN
INSERT INTO countries (country, id_planet) VALUES (country, id_planet);
SET id_country = LAST_INSERT_ID();
END IF;
SELECT id_city INTO id_city FROM cities WHERE city = city AND id_country = id_country LIMIT 1;
IF id_city IS NULL THEN
INSERT INTO cities (city, id_country) VALUES (city, id_country);
SET id_city = LAST_INSERT_ID();
END IF;
RETURN id_city;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS ConvencerUsuario;

DELIMITER //

CREATE PROCEDURE ConvencerUsuario(
IN id_usuario INT,
IN id_conspiracion INT,
IN convincente BOOLEAN
)
BEGIN
DECLARE opinion VARCHAR(255);
START TRANSACTION;
INSERT INTO user_consp (id_user, id_consp) VALUES (id_usuario, id_conspiracion);
IF convincente THEN
SET opinion = 'Este es el mejor producto del mercado';
COMMIT;
ELSE
SET opinion = 'No estoy convencido';
ROLLBACK;
END IF;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION get_cities(country VARCHAR(64), city VARCHAR(64)) RETURNS INT
BEGIN
DECLARE id_country INT UNSIGNED;
DECLARE id_city INT UNSIGNED;
SELECT id_country INTO id_country FROM countries WHERE country = country LIMIT 1;
IF id_country IS NULL THEN
INSERT INTO countries (country) VALUES (country);
SET id_country = LAST_INSERT_ID();
END IF;
SELECT id_city INTO id_city FROM cities WHERE city = city AND id_country = id_country LIMIT 1;
IF id_city IS NULL THEN
INSERT INTO cities (city, id_country) VALUES (city, id_country);
SET id_city = LAST_INSERT_ID();
END IF;
RETURN id_city;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS MatarUsuario;

DELIMITER //

CREATE PROCEDURE MatarUsuario(
IN id_usuario INT,
OUT mensaje VARCHAR(255)
)
BEGIN
DECLARE usuario VARCHAR(50);
DECLARE dead BOOLEAN;
SELECT COUNT(*) INTO dead FROM users WHERE id_user = id_usuario AND dead = 1;  
IF dead THEN
SELECT CONCAT('No puedes matar otra vez a ', first_name, ' ', last_name) INTO mensaje FROM users WHERE id_user = id_usuario;
ELSE
SELECT CONCAT(first_name, ' ', last_name) INTO usuario FROM users WHERE id_user = id_usuario;
UPDATE users SET dead = 1 WHERE id_user = id_usuario;
SET mensaje = CONCAT('HA MUERTO... ', usuario);
END IF;
END //

DELIMITER ;