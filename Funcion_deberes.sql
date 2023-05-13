DELIMITER //

CREATE FUNCTION get_city(planet VARCHAR(64), country VARCHAR(64), city VARCHAR(64)) RETURNS INT
BEGIN
DECLARE id_planet INT UNSIGNED;
DECLARE id_country INT UNSIGNED;
DECLARE id_city INT UNSIGNED;

SELECT id_planet INTO id_planet FROM planets WHERE planet = planet LIMIT 1;

IF id_planet IS NULL THEN
INSERT INTO planets (planet) VALUES (planet);
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