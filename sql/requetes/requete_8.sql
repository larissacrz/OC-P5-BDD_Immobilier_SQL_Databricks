--8. Le classement des régions par rapport au prix au mètre carré des appartements de plus de 4 pièces

SELECT
    RANK()OVER(ORDER BY AVG(v.valeur_fonciere/b.surface_carrez) DESC) AS classement,
    r.reg_nom,
    ROUND(AVG(v.valeur_fonciere/b.surface_carrez),2) AS prix_m2
FROM vente v
JOIN bien b ON b.id_bien=v.id_bien
JOIN commune c ON c.id_codedep_codecom=b.id_codedep_codecom
JOIN departement d ON d.dep_code=c.coddep
JOIN region r ON d.reg_code=r.reg_code
WHERE b.nb_pieces > 4 AND 
    lower(b.type_local) = 'appartement' AND
    v.valeur_fonciere > 0 AND 
    b.surface_carrez > 0
GROUP BY r.reg_nom;