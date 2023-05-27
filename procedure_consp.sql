DELIMITER $

DROP PROCEDURE IF EXIST ConvencerUsuario;

CREATE PROCEDURE ConvencerUsuario(
        IN id_usuario INT,
        IN id_conspiracion INT,
        IN convincente BOOLEAN
)
BEGIN

        START TRANSACTION;

	INSERT INTO user_consp (id_user, id_consp) VALUES (id_user, id_consp);

	IF opinion THEN
                COMMIT;
        ELSE
                ROLLBACK;
        END IF;

END $

DELIMITER ;
