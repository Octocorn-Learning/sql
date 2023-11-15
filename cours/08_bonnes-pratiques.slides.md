---
title: Best Practices
theme: solarized
author: Alexandre Devos
company: Octocorn
contributors:
  - Alexandre Devos
sources:
  - 
---

# SQL - Bonnes pratiques

![SQL](./assets/sql.png) <!-- .element width="30%" align="left" -->

![MySQL](./assets/mysql.png) <!-- .element width="30%" align="right" -->

----

## Bonnes pratiques

### Introduction

- Sont listés ici un ensemble de bonnes pratiques

- Elles ne sont pas exhaustives

- Elles sont à adapter en fonction de votre contexte

> Parfois, il faut savoir les contourner proprement !

----

## Bonnes pratiques

### Rédaction

Utilisez des `MAJUSCULES` pour les mots-clés SQL.
Utilisez des `minuscules` pour les noms de tables et de colonnes.

```mysql
SELECT nom, prenom
FROM eleves
WHERE nom = 'Bowie';
```

----

## Bonnes pratiques

### Nommage des colonnes

Utilisez des noms de colonnes explicites et uniques : pas d'abréviations, pas de numéros.
Plusieurs écoles : `snake_case`, `camelCase`, `PascalCase`.

```mysql
SELECT nom, prenom, date_naissance
FROM eleves
WHERE nom = 'Bowie';
```

> Restez constant !

----

## Bonnes pratiques

### Nommage des tables

- Des noms explicites

- Deux écoles : singulier ou pluriel

> Soyez constant !

----

## Bonnes pratiques

### Alignement

La lisibilité est primordiale !

```mysql
SELECT name, height, age, salary, CASE WHEN age<18 THEN "child" ELSE    
"adult" END AS child_or_adult
FROM People LEFT JOIN Income USING (name)
WHERE height<=200 and age<=65
```

```mysql
SELECT name,
       height,
       age,
       salary,
       CASE
           WHEN age < 18 THEN "child"
           ELSE "adult"
           END AS child_or_adult
FROM People
         LEFT JOIN
     Income USING (name)
WHERE height <= 200
  AND age <= 65
```

----

## Bonnes pratiques

### Mots réservés

- Évitez les mots réservés comme noms de tables ou de colonnes

- Si vous devez utiliser un mot réservé, entourez-le de backticks

> Ou plus simples : ne le faites pas !

----

## Bonnes pratiques

### Commentaires

- Commentez votre code s'il n'est pas évident

- Favorisez d'abord le lisible, puis l'efficace

> Vos commentaires doivent être cohérents !

----

## Bonnes pratiques

### Nombre de colonnes

- Évitez les tables avec trop de colonnes

- Trop de colonnes = problème de conception !

> Maximum 10/15 colonnes !

----

## Bonnes pratiques

### Entités

- Une table = une entité

- Basez vous sur le modèle entité-association !

----

## Bonnes pratiques

### Types de données

- Utilisez les bons types de données

- Évitez les types `TEXT` et `BLOB` !

> Utilisez les types de données les plus adaptés !

----

## Bonnes pratiques

### Images

- Évitez de stocker des images dans la base de données !

- Stockez plutôt le chemin vers l'image, qui pointe vers un serveur

> Les images sont lourdes et ralentissent les requêtes !

----

## Bonnes pratiques

### Clefs primaires

- Les index ne doivent pas être corrélés aux données !

> Une clef purement informatique est souvent préférable à une clef purement sémantique.

----

## Bonnes pratiques

### Index

- N'ajoutez des index que si nécessaire !

- N'en abusez pas !

> Les index ralentissent les requêtes d'écriture !

----

## Bonnes pratiques

### Transactions

- Utilisez des transactions les plus courtes possibles !

----

## Bonnes pratiques

### SELECT

NE. FAITES. PAS. DE. `SELECT *` !

> Trop lourd, trop lent, trop de données inutiles !

----

