---
title: Vues et Fonctions
theme: solarized
author: Alexandre Devos
company: Octocorn
contributors: 
  - Alexandre Devos
---

# SQL : Vues

![SQL](./assets/sql.png) <!-- .element width="30%" align="left" -->

![MySQL](./assets/mysql.png) <!-- .element width="30%" align="right" -->


----

## Vues

### Définition

- Une vue est une requête SQL stockée dans la base de données.
- Table virtuelle, dont les lignes sont issues d'une ou plusieurs tables de la base de données.

----

## Vues

### Autrement dit

- Créer une vue revient à créer une nouvelle table contenant le résultat d'une requête.
- On pourra la manipuler comme une table classique.
- Elle ne peut contenir que des `SELECT`.

----

## Vues

### Objectifs

- Eviter de dupliquer du code. (et de recréer des tables).
- Simplifier les requêtes complexes.
- On peut se baser sur une vue pour faire des opérations

----

## Vues

### Création

```sql
CREATE VIEW nom_vue AS
SELECT colonne1, colonne2, ...
FROM table
WHERE condition;
```

----

## Vues

### Exemple

```sql
CREATE VIEW `Promotions_en_cours` AS
SELECT
    eleves.nom AS 'Nom',
        eleves.prenom as 'Prénom',
        TIMEDIFF(NOW(), date_naissance) AS 'Age',
        classes.annee AS Promotion
FROM eleves
         LEFT JOIN classes ON eleves.classe_id = classes.id
WHERE classes.annee = 2024
```

> Que contiendra cette vue ?

----

## Vues

### Exemple

- On pourra ensuite utiliser cette vue comme une table classique.

```sql
SELECT * FROM `Promotions_en_cours`
```

----

## Vues

### Quelques précisions

- Utilisez des alias pour les colonnes, surtout en cas de doublons.
- La requête ne doit pas faire référence à des variables locales.
- Les tables doivent exister avant de créer la vue.
- La vue ne peut pas contenir de sous requête `SELECT` dans la clause `FROM`.

---

## Fonctions


![SQL](./assets/sql.png) <!-- .element width="30%" align="left" -->

![MySQL](./assets/mysql.png) <!-- .element width="30%" align="right" -->

----

## Fonctions

### Définition

- Une fonction est un bloc de code qui effectue une tâche spécifique.
- SQL propose de nombreuses fonctions, ayant chacune un rôle bien précis.
- Il en existe deux types : les fonctions d'**agrégation** et les fonctions **scalaires**.

----

## Fonctions Scalaires

### Définition

- Une fonction scalaire est une fonction qui concerne une seule valeur.
- Elle permet de manipuler des données.
- Elle ne retourne qu'une seule valeur.
- Elle peut être utilisée dans une requête SQL comme une colonne.

----

## Fonctions Scalaires

### Arrondis

```mysql
SELECT ROUND(12.345, 2); -- Arrondi à x (2) décimales
SELECT CEIL(12.345); -- Arrondit supérieur
SELECT FLOOR(12.345); -- Arrondit inférieur
SELECT TRUNCATE(12.345, 2); -- Tronque à x (2) décimales
```

----

## Fonctions Scalaires

### Exposants et racies

```mysql
SELECT POW(2, 3); -- 2 puissance 3
SELECT SQRT(9); -- Racine carrée
```

----

## Fonctions Scalaires

### Autres

```mysql
SELECT SIGN(-12); -- Renvoie -1 si négatif, 0 si nul, 1 si positif
SELECT ABS(-12); -- Renvoie la valeur absolue
SELECT MOD(12, 5); -- Renvoie le reste de la division euclidienne
```

----

## Fonctions Scalaires

### Longueur des chaines

```mysql
SELECT LENGTH('Hello'); -- Renvoie le nombre d'octets
SELECT CHAR_LENGTH('Hello'); -- Renvoie le nombre de caractères
SELECT BIT_LENGTH('Hello'); -- Renvoie le nombre de bits
```

> 1 octet = 8 bits = 1 caractère

----

## Fonctions Scalaires

### TRIM

- Supprime des caractères en début et fin de chaine.

```mysql
-- Espaces avant et après
SELECT TRIM(' Octocorn ') AS both_espace, 
-- Espaces avant
TRIM(LEADING FROM ' Octocorn ') AS lead_espace, 
-- Espaces après
TRIM(TRAILING FROM ' Octocorn ') AS trail_espace,

-- e avant et après
TRIM('e' FROM 'eeeeOctocorneeee') AS both_e,
-- e avant
TRIM(LEADING 'e' FROM 'eeeOctocorneee') AS lead_e,
-- e après
TRIM(BOTH 'e' FROM 'eeeOctocorneee') AS both_e,
```

----

## Fonctions Scalaires

### SUBSTRING

- Renvoie une sous chaine de caractères.

```mysql
SELECT SUBSTRING('Octocorn', 2) AS from2,
-- Affiche après avoir sauté 1 caractères
SUBSTRING('Octocorn' FROM 3) AS from3,
-- Affiche à partir du troisième caractère
SUBSTRING('Octocorn', 2, 3) AS from2long3, 
-- Affiche 3 caractères à partir du second
SUBSTRING('Octocorn' FROM 3 FOR 1) AS from3long1;
-- Affiche 1 caractère à partir du troisième
```

----

## Fonctions Scalaires

### Changer la casse

```mysql
SELECT UPPER('Octocorn') AS upper, -- En majuscules
LOWER('Octocorn') AS lower, -- En minuscules
```

> On peut aussi utiliser `UCASE` et `LCASE`

----

## Fonctions Scalaires

### LEFT et RIGHT

- Renvoie une sous chaine de caractères.

```mysql
SELECT LEFT('Octocorn', 2) AS left, -- 2 premiers caractères
RIGHT('Octocorn', 2) AS right; -- 2 derniers caractères
```

----

## Fonctions Scalaires

### Et d'autres !

- `REVERSE` : Inverse une chaine de caractères.
- `REPEAT` : Répète une chaine de caractères.
- `REPLACE` : Remplace une chaine de caractères.
- `INSERT` : Insère une chaine de caractères.

----

## Fonctions d'agrégation

### Définition

- Une fonction d'agrégation est une fonction qui concerne un ensemble de valeurs.
- Elles permettent entre autres de faire des statistiques, générer des totaux, groupements, etc.

> Ecoutez bien, car vous allez avoir besoin de ces fonctions pour vos exercices !

----

## Fonctions

### Compter

```mysql
SELECT COUNT(*) AS nb_eleves FROM eleves; -- Nombre d'élèves
SELECT COUNT(DISTINCT classe_id) AS nb_classes FROM eleves; -- Nombre de classes
```

----

## Fonctions

### MIN et MAX

```mysql
SELECT MIN(date_naissance) AS min_date FROM eleves; -- Date de naissance la plus ancienne
SELECT MAX(date_naissance) AS max_date FROM eleves; -- Date de naissance la plus récente
SELECT SUM(age) AS sum_age FROM eleves; -- Somme des âges
SELECT AVG(age) AS avg_age FROM eleves; -- Moyenne des âges
```

----

## Fonctions

### GROUP BY

- Permet de grouper les résultats selon une colonne.
- Elimine les doublons.

```mysql
SELECT classe_id, 
       COUNT(*) AS nb_eleves 
FROM eleves 
GROUP BY classe_id;
```

> Que comprenez vous ici ?

----

## Fonctions

### GROUP BY

```mysql
SELECT classe_id, 
       COUNT(*) AS nb_eleves 
FROM eleves 
GROUP BY classe_id;
```

Ici, nous avons le nombre d'élèves par classe, tout simplement.

----

## Fonctions

### HAVING

- Permet de filtrer les résultats d'un `GROUP BY`.
- Remplace le `WHERE` dans ce cas.

```mysql
SELECT classe_id, 
       COUNT(*) AS nb_eleves
FROM eleves
GROUP BY classe_id
HAVING nb_eleves > 2;
```

> N'affichera que les classes de plus de 2 élèves.

----

## A vous de jouer !

Réalisez la partie 2 du TP Beer !

----

## La suite !

[index](index.html)