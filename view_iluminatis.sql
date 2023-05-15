CREATE VIEW usuarios_iluminatis AS
SELECT users.id_user, users.username, users.email, users.gender, users.country, users.birth_date, users.created_at
FROM users
JOIN iluminatis ON users.id_user = iluminatis.id_user;

CREATE VIEW cantidad_iluminatis AS
SELECT COUNT(*) AS cantidad_iluminatis
FROM iluminatis;
