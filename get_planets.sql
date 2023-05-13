DROP TABLE IF EXISTS planets;
CREATE TABLE planets (
  id_planet INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  planet VARCHAR(64) NOT NULL
);

ALTER TABLE countries ADD COLUMN id_planet INT UNSIGNED NOT NULL AFTER id_country;

ALTER TABLE countries ADD FOREIGN KEY (id_planet) REFERENCES planets(id_planet);


INSERT INTO planets (planet) VALUES ('Earth');
INSERT INTO planets (planet) VALUES ('Mars');
INSERT INTO planets (planet) VALUES ('Venus');

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

INSERT INTO addresses (id_user, street, id_city) VALUES (1, 'Calle Mayor 1', 1);
INSERT INTO addresses (id_user, street, id_city) VALUES (1, 'Broadway 123', 2);
INSERT INTO addresses (id_user, street, id_city) VALUES (1, 'Tiananmen Square 1', 3);
INSERT INTO addresses (id_user, street, id_city) VALUES (2, 'Mars Street 1', 4);
INSERT INTO addresses (id_user, street, id_city) VALUES (2, 'Venus Street 1', 5);
INSERT INTO addresses (id_user, street, id_city) VALUES (3, 'Calle Gran Via 1', 1);
INSERT INTO addresses (id_user, street, id_city) VALUES (3, 'Central Park 1', 2);
INSERT INTO addresses (id_user, street, id_city) VALUES (3, 'Forbidden City 1', 3);


CREATE VIEW planet_address_count AS
SELECT planets.planet, COUNT(addresses.id_address) AS address_count
FROM planets
