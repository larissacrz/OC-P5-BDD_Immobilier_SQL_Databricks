-- 3. Proportion des ventes d'appartement par le nombre de pièces
-- filtré nb_pieces != 0

SELECT nb_pieces, 
        COUNT(*) AS total_apparts_vendus,
        ROUND((1.0*COUNT(*)/SUM(COUNT(*)) OVER()*100),3) AS proportion_apparts_vendus
FROM vente v
JOIN bien b on v.id_bien=b.id_bien
WHERE lower(type_local) = 'appartement' AND nb_pieces != 0
GROUP BY nb_pieces;