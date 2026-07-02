--9. Liste des communes ayant eu au moins 50 ventes au 1er trimestre

SELECT 
    c.commune, 
    COUNT(*) AS total_vendu
FROM vente v
JOIN view_date dt ON dt.date_mutation=v.date_mutation
JOIN bien b ON v.id_bien=b.id_bien
JOIN commune c ON b.id_codedep_codecom=c.id_codedep_codecom
WHERE dt.trimestre = 'T1'
GROUP BY c.commune
HAVING COUNT(*) >=50
ORDER BY total_vendu;