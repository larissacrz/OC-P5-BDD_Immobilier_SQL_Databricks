--6. Liste des 10 appartements les plus chers avec la région et le nombre de mètres carré

SELECT 
    b.id_bien,
    r.reg_nom,
    v.valeur_fonciere,
    b.surface_carrez    
FROM vente v
JOIN bien b ON b.id_bien=v.id_bien
JOIN commune c ON c.id_codedep_codecom=b.id_codedep_codecom
JOIN departement d ON c.coddep=d.dep_code
JOIN region r ON d.reg_code=r.reg_code
WHERE lower(b.type_local) = 'appartement' AND
        v.valeur_fonciere > 0 AND
        b.surface_carrez > 0
ORDER BY v.valeur_fonciere DESC
LIMIT 10;
