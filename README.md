# P5 – Création et exploitation d'une base de données immobilière avec SQL et Databricks

## Contexte

Laplace Immo (entreprise fictive) est un réseau national d'agences immobilières souhaitant, dans le cadre du projet DATAImmo, centraliser et exploiter les données du marché immobilier français afin de faciliter l'analyse des transactions et l'étude des prix de vente des biens.

Ce projet consiste à concevoir une base de données relationnelle à partir de plusieurs sources de données publiques, puis à l'implémenter sur Databricks afin de réaliser des analyses SQL répondant à des problématiques métier.

---

## Objectifs

* Analyser et structurer les données issues de plusieurs sources.
* Concevoir un modèle relationnel normalisé.
* Construire un dictionnaire de données.
* Implémenter une base de données sur Databricks.
* Charger et intégrer les données dans le respect des contraintes d'intégrité.
* Réaliser des analyses SQL du marché immobilier.
* Garantir la conformité des traitements avec la réglementation RGPD.

---

## Jeux de données

Trois fichiers de données sont mis à disposition :

* Extrait des Transactions immobilières et foncières - DVF (Demandes de Valeur Foncières) - Open Data ;
* Données de recensement de la population - Insee ;
* Référentiel géographique (Régions, départements et communes françaises) - data.gouv.fr.

---

## Livrables

* Dictionnaire de données
* Schéma relationnel
* Implémentation du modèle sur Databricks
* Requêtes SQL exécutées dans Databricks
* Présentation des résultats 

---

## Démarche

### 1. Analyse des données

* Étude des trois jeux de données.
* Identification des variables pertinentes.
* Élaboration d'un dictionnaire de données.
* Définition des règles de gestion applicables.

<legend>Extrait du dictionnaire des données</legend> 
</br>
<img src='/schema/P5_E1_Extrait_dic_donnees.png'  width = 70%>

### 2. Modélisation

* Identification des entités métier.
* Construction du schéma relationnel.
* Définition des clés primaires et étrangères.
* Normalisation des données jusqu'à la troisième forme normale (3NF).

<legend>Schéma relationnel</legend> 

<img src='/schema/P5_E2_Schèma_complet_dark.jpg'  width = 70%>

### 3. Implémentation

* Implémentation du modèle de données dans Databricks :
    * Création du schéma ;
    * Création des tables ;
    * Chargement des données dans le Catalog ;
    * Contrôle de la qualité et de l'intégrité des données.

<legend>Databricks Catalog Screenshot</legend>

<img src='/schema/P5_E4_databricks_catalog_screenshot.png'  width = 40%>

### 4. Analyse SQL

* Production d'indicateurs immobiliers.
* Analyses géographiques.
* Comparaisons entre territoires.
* Réponse aux besoins métier exprimés par Laplace Immo.

---

## Requêtes

Chaque requête a été exécutée dans l’environnement Databricks SQL (SQL Editor) et a permis de produire les indicateurs suivants :

### 1. Nombre total d’appartements vendus au 1er semestre 2020

* 31 380 appartements vendus au total

<img src='/charts/1_Total appartements vendus au 1er semestre 2020_.png'  width = 40%>

<hr/>

### 2. Le nombre de ventes d’appartement par région pour le 1er semestre 2020

* 14 000 seulement en Région Île-de-France  

<img src='/charts/2_Ventes appartement par région pour le 1er semestre de 2020.png'  width = 70%>

<hr/>

### 3. Proportion des ventes d’appartements par le nombre de pièces

* Préférence par les appartements de 2 et 3 pièces

<img src='/charts/3_Proportion appartements vendus par nombre de pièces.png'  width = 40%>

<hr/>

### 4. Liste des 10 départements où le prix du mètre carré est le plus élevé

* Paris a le prix au m² le plus élevé

<img src='/charts/4_Top 10 Départements - Prix au m2.png'  width = 60%>

<hr/>

### 5. Prix moyen du mètre carré d’une maison en Île-de-France

* 4000 € en moyenne le prix au m² d’une maison en Île-de-France

<img src='/charts/5_Prix m2 moyen maison Ile de France.png'  width = 50%>

<hr/>

### 6. Liste des 10 appartements les plus chers avec la région et le nombre de mètres carrés

* Les 10 appartements les plus chers sont tous localisés en région Île-de-France
* Sans corrélation prix-surface évidente
* Valeurs extrêmes suggérant des anomalies ou biens d'exception

<img src='/charts/6_Top 10 des appartements les plus chers Prix vs Surface par région.png'  width = 50%>

<hr/>

### 7. Taux d’évolution du nombre de ventes entre le premier et le second trimestre de 2020

* Hausse du nombre de ventes d'immeubles de 3,68% 

<img src='/charts/7_Taux de croissance trimestriel des ventes en 2020.png'  width = 40%>

<hr/>

### 8. Le classement des régions par rapport au prix au mètre carré des appartements de plus de 4 pièces

* Île-de-France en tête des prix au m² pour les T4+

<img src='/charts/8_Prix au m2 par région appartements plus de 4 pièces.png'  width = 60%>

<hr/>

### 9. Liste des communes ayant eu au moins 50 ventes au 1er trimestre

* Paris domine parmi les 48 communes à plus de 50 ventes, avec les 17e, 15e et 18e arrondissement en tête 

<img src='/charts/9_Top et bottom 5 communes - Ventes T1 2020.png'  width = 60%>

<hr/>

### 10. Différence en pourcentage du prix au mètre carré entre un appartement de 2 pièces et un appartement de 3 pièces

* Le prix au m² du T3 est 12.4% inférieur à celui du T2

<img src='/charts/10_Différence prix m2 moyen T2 et T3.png'  width = 40%>

<hr/>

### 11. Les moyennes de valeurs foncières pour le top 3 des communes des départements 6, 13, 33, 59 et 69

* Les Alpes-Maritimes affichent les plus fortes valeurs foncières moyennes, portées par leurs communes littorales d’exception

<img src='/charts/11_Top 3 des communes forte valeur foncière moyenne.png'  width = 60%>

<hr/>

### 12. Les 20 communes avec le plus de transactions pour 1000 habitants pour les communes qui dépassent les 10 000 habitants

* Le 2e arrondissement de Paris enregistre le taux le plus élevé, avec 5.84 transactions pour 1000 habitants.

<img src='/charts/12_transactions pour 1000 habitants - communes de plus de 10 000 habitants.png'  width = 60%>

<hr/>

## Compétences mobilisées
* La capacité à créer, modéliser et interroger une base de données hébergée sur le cloud.
* Manipuler des données brutes pour en extraire des indicateurs exploitables.
* La maîtrise de SQL, des modèles relationnels et des environnements cloud.
* Capacité à justifier d’une méthodologie de travail rigoureuse, incluant l'usage responsable de l'intelligence artificielle.

<hr/>

## Environnement de travail
* Excel - Dictionnaire des données
* Draw.io - Outil de modélisation
* VS code/Python - EDA et préparation des données
* Databricks - stockage cloud et exécution SQL

## RGPD

Les données contenant des informations personnelles ont été pseudonymisées et isolées dans une table distincte, conservée uniquement en local et non exposée dans la base de données Databricks. Les analyses SQL ont été réalisées exclusivement à partir de données conformes aux exigences du RGPD.
