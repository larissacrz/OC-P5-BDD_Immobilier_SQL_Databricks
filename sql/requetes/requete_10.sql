-- 10. Différence en pourcentage du prix au mètre carré entre un appartement de 2 pièces et un appartement de 3 pièces

WITH prix_m2_par_piece AS(
            SELECT 
    AVG(CASE WHEN nb_pieces = 2 THEN valeur_fonciere/surface_carrez END) AS prix_m2_T2, 
    AVG(CASE WHEN nb_pieces = 3 THEN valeur_fonciere/surface_carrez END) AS prix_m2_T3     
FROM vente v
JOIN bien b ON b.id_bien=v.id_bien
WHERE lower(type_local) = 'appartement' AND
    valeur_fonciere > 0 AND
    surface_carrez > 0
)
SELECT ROUND((prix_m2_T3-prix_m2_T2)/prix_m2_T2*100,2) AS diff_prix_m2
FROM prix_m2_par_piece