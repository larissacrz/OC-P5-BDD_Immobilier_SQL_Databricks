--1. Nombre total d'appartements vendus au 1er semestre 2020
SELECT COUNT(*) AS total_vendu
FROM vente v
JOIN view_date dt ON dt.date_mutation=v.date_mutation
JOIN bien b on v.id_bien=b.id_bien
WHERE lower(type_local) = 'appartement' AND 
    semestre = 'S1';
