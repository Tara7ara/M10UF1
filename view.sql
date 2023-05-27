--DROP VIEW IF EXISTS dinero_por_planeta;
--
--CREATE VIEW dinero_por_planeta AS
--SELECT planet, SUM(revenue) AS medicine_revenue
--FROM medicines
--GROUP BY planet;
DROP VIEW IF EXISTS beneficios_por_planeta;
CREATE VIEW beneficios_por_planeta AS
SELECT SUM(price - cost) AS beneficios
FROM medicines;
GROUP BY planet;
