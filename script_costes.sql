--script numero 1

SELECT
  medicines.id_medicine,
  COUNT(treatments.id_medicine) medicines,
  medicines.cost,
  SUM(treatments.cost_production) total_cost
FROM medicines
LEFT JOIN treatments ON medicines.id_medicine = treatments.id_medicine
GROUP BY medicines.cost;


--script numero 2

CREATE VIEW coste_total AS 
SELECT SUM(coste_produccion) as sumatorio_total FROM produccion_medicamentos;
SELECT * FROM coste_total;