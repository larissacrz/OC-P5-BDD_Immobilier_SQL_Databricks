-- Vérification de l'intégrité référentielle
SELECT 'bien' AS table_name, 
        COUNT(*) AS nb_lignes,
        CASE WHEN COUNT(*) = COUNT(DISTINCT id_bien) THEN 'OK' ELSE 'ANOMALIE' END AS id_unique,
        COUNT(*) - COUNT(DISTINCT id_bien) AS doublons
FROM bien
UNION ALL
SELECT 'vente' AS table_name, 
        COUNT(*) AS nb_lignes,
        CASE WHEN COUNT(*) = COUNT(DISTINCT id_vente) THEN 'OK' ELSE 'ANOMALIE' END AS id_unique,
        COUNT(*) - COUNT(DISTINCT id_vente) AS doublons
FROM vente
UNION ALL
SELECT 'commune' AS table_name, 
        COUNT(*) AS nb_lignes,
        CASE WHEN COUNT(*) = COUNT(DISTINCT id_codedep_codecom) THEN 'OK' ELSE 'ANOMALIE' END AS id_unique,
        COUNT(*) - COUNT(DISTINCT id_codedep_codecom) AS doublons
FROM commune
UNION ALL
SELECT 'departement' AS table_name, 
        COUNT(*) AS nb_lignes,
        CASE WHEN COUNT(*) = COUNT(DISTINCT dep_code) THEN 'OK' ELSE 'ANOMALIE' END AS id_unique,
        COUNT(*) - COUNT(DISTINCT dep_code) AS doublons
FROM departement
UNION ALL
SELECT 'region' AS table_name, 
        COUNT(*) AS nb_lignes,
        CASE WHEN COUNT(*) = COUNT(DISTINCT reg_code) THEN 'OK' ELSE 'ANOMALIE' END AS id_unique,
        COUNT(*) - COUNT(DISTINCT reg_code) AS doublons
FROM region; 