--2. Le nombre de ventes d'appartement par région pour le 1er semestre de 2020

SELECT reg_nom, count(*) AS total_vendu
FROM vente v
JOIN view_date dt ON dt.date_mutation=v.date_mutation
JOIN bien b on v.id_bien=b.id_bien
JOIN commune c on c.id_codedep_codecom=b.id_codedep_codecom
JOIN departement d on d.dep_code=c.coddep
JOIN region r on d.reg_code=r.reg_code
WHERE lower(type_local) = 'appartement' AND 
    dt.semestre = 'S1'
GROUP BY reg_nom
ORDER BY total_vendu DESC ;
