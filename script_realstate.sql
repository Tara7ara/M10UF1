DROP DATABASE IF EXISTS real_state;
CREATE DATABASE real_state;
USE real_state;

DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS streets;
DROP TABLE IF EXISTS streets_numbers;
DROP TABLE IF EXISTS staircases;
DROP TABLE IF EXISTS floors;
DROP TABLE IF EXISTS doors;
DROP TABLE IF EXISTS zip_codes;



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

DROP TABLE IF EXISTS addresses;
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