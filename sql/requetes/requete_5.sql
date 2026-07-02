--5. Prix moyen du mètre carré d'une maison en Ile de France

SELECT d.reg_code,
        ROUND(AVG(valeur_fonciere/surface_reelle),2) AS prix_m2_moyen
FROM vente v
JOIN bien b ON v.id_bien=b.id_bien
JOIN commune c ON c.id_codedep_codecom=b.id_codedep_codecom
JOIN departement d ON d.dep_code=c.coddep
WHERE valeur_fonciere > 0 AND 
        surface_reelle > 0 AND
        lower(type_local)='maison' AND
        d.reg_code = (
                SELECT reg_code 
                FROM region 
                WHERE lower(reg_nom) LIKE 'ile%france'
                )
GROUP BY d.reg_code