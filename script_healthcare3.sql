DROP DATABASE IF EXISTS healthcare3;
CREATE DATABASE healthcare3;
USE healthcare3;


DROP TABLE IF EXISTS medicines;
CREATE TABLE medicines(

id_medicine INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
medicine VARCHAR(192),
cost	DECIMAL(9,2),
price	DECIMAL(9,2)
);

DROP TABLE IF EXISTS users;
CREATE TABLE users (

id_user INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
username       VARCHAR(50)  NOT NULL,
password       VARCHAR(32)  NOT NULL,
password_hash_md5  VARCHAR(128) NOT NULL,
first_name     VARCHAR(50)  NOT NULL,
last_name      VARCHAR(50)  NOT NULL,
email          VARCHAR(100) NOT NULL,
date_of_birth  DATE         NOT NULL
);

DROP TABLE IF EXISTS doctors;

CREATE TABLE doctors (
id_doctor INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
doctor VARCHAR(32)
);

DROP TABLE IF EXISTS conditions;
CREATE TABLE conditions (
id_condition INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
condicion VARCHAR(64) NOT NULL,
symptoms TEXT,
description TEXT,
deadly BOOL
);

DROP TABLE IF EXISTS diagnoses;
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

DROP TABLE IF EXISTS treatments;
CREATE TABLE treatments (
id_treatment INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
id_condition INT UNSIGNED NOT NULL,
id_diagnosis BIGINT UNSIGNED,
id_medicine  INT UNSIGNED NOT NULL,

FOREIGN KEY (id_condition) REFERENCES conditions(id_condition),
FOREIGN KEY (id_diagnosis) REFERENCES diagnoses(id_diagnosis),
FOREIGN KEY (id_medicine) REFERENCES medicines(id_medicine)
);

INSERT INTO users (username, password, password_hash_md5, first_name, last_name, email, date_of_birth) VALUES ('redmanolo', 'manolin123', 'password_hash_md5_1', 'Manolo', 'Tanos', 'manolin@example.com', '2004-01-01');
INSERT INTO users (username, password, password_hash_md5, first_name, last_name, email, date_of_birth) VALUES ('robertapamela', 'robertita4', 'password_hash_md5_2', 'Roberta', 'Sinclaire', 'roberta@example.com', '1999-11-02');
INSERT INTO users (username, password, password_hash_md5, first_name, last_name, email, date_of_birth) VALUES ('concha', 'conchadetumadre', 'password_hash_md5_3', 'Conchita', 'Bandida', 'laconchi@example.com', '2008-01-13');

INSERT INTO doctors (doctor) VALUES ('Dr. John');
INSERT INTO doctors (doctor) VALUES ('Dr. Marcel');

INSERT INTO medicines (medicine,cost,price) VALUES ('Ibuprofeno', 10.00 , 20.00);
INSERT INTO medicines (medicine,cost,price) VALUES ('Diacepan', 19.00 , 27.40);
INSERT INTO medicines (medicine,cost,price) VALUES ('Cremitas anti hongos', 240.00 , 550.00);
INSERT INTO medicines (medicine,cost,price) VALUES ('Rinomer', 5.00 , 12.34);

INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition A','Symptom A','Description A',false);
INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition B','Symptom B','Description B',true);
INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition C','Symptom C','Description C',false);
INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition D','Symptom D','Description D',true);
INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition E','Symptom E','Description E',false);
INSERT INTO conditions (condicion,symptoms,description,deadly) VALUES ('Condition F','Symptom F','Description F',true);

INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) 
VALUES ('Retorcijones', '2023-05-03 13:00:00', 2, 1, 1);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) 
VALUES ('Nariz Taponada', '2023-05-03 13:00:00', 1, 2, 1);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) 
VALUES ('Fimosis', '2023-05-03 13:00:00', 1, 1, 1);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) 
VALUES ('Covid-23', '2023-05-03 13:00:00', 2, 3, 1);

INSERT INTO treatments (id_condition, id_diagnosis, id_medicine) 
VALUES (1, 1, 1);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine) 
VALUES (1, 1, 1);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine) 
VALUES (1, 1, 1);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine) 
VALUES (1, 1, 1);
INSERT INTO treatments (id_condition, id_diagnosis, id_medicine) 
VALUES (1, 1, 1);

