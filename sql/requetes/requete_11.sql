--11. Les moyennes de valeur foncières pour le top 3 des communes des départements 6, 13, 33, 59, 69

WITH valeur_fonciere_moyenne_par_dep_commune AS(
SELECT c.coddep, 
        c.commune,
        ROUND(AVG(v.valeur_fonciere),2) AS valeur_fonciere_moyenne
FROM vente v
JOIN bien b ON b.id_bien=v.id_bien
JOIN commune c ON c.id_codedep_codecom=b.id_codedep_codecom  
WHERE c.coddep IN ('06', '13', '33', '59', '69') AND
        v.valeur_fonciere > 0
GROUP BY c.coddep, c.commune
),
ranking_communes AS(
SELECT *, 
        RANK()OVER(PARTITION BY coddep ORDER BY valeur_fonciere_moyenne DESC) AS rank
FROM valeur_fonciere_moyenne_par_dep_commune
)
SELECT coddep, 
        rank, 
        commune, 
        valeur_fonciere_moyenne    
FROM ranking_communes
WHERE rank <=3;