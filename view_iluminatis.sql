CREATE VIEW usuarios_iluminatis AS
SELECT user.id_user, user.username, user.email, user.gender, user.country, user.birth_date, user.created_at
FROM users user
JOIN iluminatis i ON user.id_user = iluminatis.id_user;

CREATE VIEW cantidad_iluminatis AS
SELECT COUNT(*) AS cantidad_iluminatis
FROM iluminatis;
