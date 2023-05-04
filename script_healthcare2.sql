DROP DATABASE IF EXISTS healthcare2;
CREATE DATABASE healthcare2;
USE healthcare2;


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

INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) 
VALUES ('Cagarrinas', '2023-05-03 13:00:00', 1, 1, 1);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) 
VALUES ('Cancer', '2023-05-03 13:00:00', 1, 1, 1);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) 
VALUES ('Fimosis', '2023-05-03 13:00:00', 1, 1, 1);
INSERT INTO diagnoses (diagnosis, datetime, id_doctor, id_user, id_condition) 
VALUES ('Gripe alonistican', '2023-05-03 13:00:00', 1, 1, 1);

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
