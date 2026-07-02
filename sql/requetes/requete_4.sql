--4. Liste des 10 départements où le prix du mètre carré est le plus élevé

WITH prix_m2_par_dep AS(
SELECT 
        coddep,
        ROUND(AVG(valeur_fonciere/surface_carrez),2) AS prix_m2,
        RANK()OVER(order by AVG(valeur_fonciere/surface_carrez) DESC) AS rank
FROM vente v
JOIN bien b ON v.id_bien=b.id_bien
JOIN commune c ON c.id_codedep_codecom=b.id_codedep_codecom
WHERE valeur_fonciere > 0 AND 
        surface_carrez > 0 
GROUP BY coddep
)
SELECT rank,
        dep_nom,
        prix_m2
FROM prix_m2_par_dep p
JOIN departement d ON p.coddep=d.dep_code
WHERE rank <= 10
ORDER BY rank 