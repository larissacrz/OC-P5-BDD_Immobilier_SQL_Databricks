--7. Taux d'évolution du nombre de ventes entre le premier et le second trimestre 2020

WITH ventes_par_trimestre AS (
  SELECT
    dt.trimestre,
    COUNT(*) As total_ventes
  FROM vente v
  JOIN view_date dt ON dt.date_mutation = v.date_mutation
  GROUP BY dt.trimestre
)
SELECT *,
  LAG(total_ventes) OVER (ORDER BY trimestre) AS dernier_trim,
  ROUND((1.0 * total_ventes - (LAG(total_ventes) OVER (ORDER BY trimestre)))
      / (LAG(total_ventes) OVER (ORDER BY trimestre))
      * 100,2) AS proportion
FROM ventes_par_trimestre