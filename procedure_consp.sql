DELIMITER $
DROP PROCEDURE IF EXISTS InsertarOpinion;
CREATE PROCEDURE InsertarOpinion(
    IN id_usuario INT,
    IN id_conspiracion INT,
    IN opinion BOOLEAN
)
BEGIN
    START TRANSACTION;
    
    INSERT INTO user_consp (id_user, id_consp) VALUES (id_usuario, id_conspiracion);

    IF opinion THEN
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END $
DELIMITER ;
