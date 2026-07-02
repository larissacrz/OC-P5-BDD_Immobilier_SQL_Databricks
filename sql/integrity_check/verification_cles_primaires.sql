-- Vérification des clés primaires

SELECT 'bien' AS table,
    COUNT(*) AS total_lignes,
    COUNT(DISTINCT id_bien) AS id_uniques,
    MIN(id_bien) AS id_min,
    MAX(id_bien) AS id_max,
    MAX(id_bien) - MIN(id_bien) + 1 AS plage_attendue,
    COUNT(*) - COUNT(DISTINCT id_bien) AS doublons
FROM bien

UNION ALL

SELECT 'vente' AS table,
    COUNT(*) AS total_lignes,
    COUNT(DISTINCT id_vente) AS id_uniques,
    MIN(id_vente) AS id_min,
    MAX(id_vente) AS id_max,
    MAX(id_vente) - MIN(id_vente) + 1 AS plage_attendue,
    COUNT(*) - COUNT(DISTINCT id_vente) AS doublons
FROM vente;