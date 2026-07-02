--12. Les 20 communes avec le plus de transactions pour 1000 habitants pour les communes qui dépassent les 10_000 habitants

SELECT c.commune, 
        COUNT(*) AS total_vendu,
        c.ptot,
        ROUND((COUNT(*)*1000.0/c.ptot),2) AS transaction_par_mille_hab
FROM vente v
JOIN bien b ON b.id_bien=v.id_bien
JOIN commune c ON c.id_codedep_codecom=b.id_codedep_codecom
WHERE ptot > 10000 
GROUP BY c.id_codedep_codecom, c.commune, c.ptot
ORDER BY transaction_par_mille_hab DESC
LIMIT 20;
