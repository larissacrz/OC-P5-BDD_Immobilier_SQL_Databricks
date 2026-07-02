-- Vue pour la gestion des dates de mutation

CREATE VIEW IF NOT EXISTS view_date AS
SELECT DISTINCT(date_mutation), 
    CASE 
        WHEN date_mutation >= '2020-01-01' AND date_mutation < '2020-04-01' THEN 'T1'
        WHEN date_mutation >= '2020-04-01' AND date_mutation < '2020-07-01' THEN 'T2'
        ELSE 'autre'
    END AS trimestre,
    CASE WHEN date_mutation >= '2020-01-01' AND date_mutation <'2020-07-01' THEN 'S1' END AS semestre
FROM vente;
