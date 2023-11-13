## 10 Listez pour chaque ticket la quantité totale d’articles vendus. (Classer par quantité décroissante)

```mysql

```

- Vous aurez besoin de la fonction `SUM`
- Vous devrez partir de la table `Ventes`
- Vous devrez utiliser la fonction `GROUP BY`



## 11 Listez chaque ticket pour lequel la quantité totale d’articles vendus est supérieure à 500. (Classer par quantité décroissante)

```mysql
```

- Vous devrez partir de la table `Ventes`
- Vous devrez utiliser la fonction `GROUP BY`
- Vous devrez utiliser `ORDER BY`

> Attention, avec une fonction `GROUP BY`, vous ne pouvez pas utiliser `WHERE` pour filtrer les données. Vous devrez utiliser `HAVING` à la place.

## 12 Listez chaque ticket pour lequel la quantité totale d’articles vendus est supérieure à 500. On exclura du total, les ventes ayant une quantité supérieure à 50 (classer par quantité décroissante)

```mysql
```

- Vous devrez partir de la table `Ventes`
- Vous réaliserez la somme des quantités vendues avec la fonction `SUM` dans le `SELECT`
- Vous devrez utiliser `WHERE` avant `GROUP BY`
- Vous devrez utiliser la fonction `GROUP BY` et `HAVING`
- Vous terminerez par `ORDER BY`

## 13 Listez les bières de type ‘Trappiste’. (id, nom de la bière, volume et titrage)

```mysql
```

- Vous devrez partir de la table `article`
- Vous devrez faire une jointure avec la table `type`

> Le nom de la table `type` est mal choisi, car mot réservé. Il faudra donc l'entourer de backticks.

## 14 Listez les marques de bières du continent ‘Afrique’

```mysql

```

- Vous devrez partir de la table `marque`
- Vous devrez faire une jointure avec la table `pays`
- Vous devrez faire une jointure avec la table `continent`
- Vous devrez utiliser la clause `WHERE` pour filtrer les données

## 15 Lister les bières du continent ‘Afrique’

```mysql
```

- Vous devrez partir de la table `article`
- Vous devrez faire une jointure avec la table `marque`
- Vous devrez faire une jointure avec la table `pays`
- Vous devrez faire une jointure avec la table `continent`
- Vous devrez utiliser la clause `WHERE` pour filtrer les données

## 16. Lister les tickets (année, numéro de ticket, montant total payé). En sachant que le prix de vente est égal au prix d’achat augmenté de 15%.

```mysql

```

- Vous devrez partir de la table `ticket`
- Vous devrez faire un `SUM` sur la quantité multipliée par le prix d'achat, et ajouter 15% au résultat (*1.15)
- Vous devrez faire une jointure avec la table `ventes`
- Vous devrez faire une jointure avec la table `article`
- Vous devrez utiliser la fonction `GROUP BY` pour regrouper les données par ticket et par année

> `USING` est une alternative à `ON` pour les jointures. Il permet de faire une jointure sur une ou plusieurs colonnes portant le même nom dans les deux tables.

```mysql
SELECT colonne1, colonne2, colonne3
FROM table1
INNER JOIN table2 USING (colonne1, colonne2)
```

## 17  Donner le C.A. par année.

```mysql
```

- Vous devrez partir de la table `ventes`
- Vous devrez faire la somme des quantités multipliées par le prix d'achat, et ajouter 15% au résultat (*1.15)
- Vous devrez faire une jointure avec la table `article`
- Vous devrez utiliser la fonction `GROUP BY` pour regrouper les données par année

## 18. Lister les quantités vendues de chaque article pour l’année 2016.

```mysql

```

- Vous devrez partir de la table `ventes`
- Vous devrez faire la somme des quantités vendues avec la fonction `SUM` dans le `SELECT`
- Vous devrez faire une jointure avec la table `article`
- Vous devrez utiliser la clause `WHERE` pour filtrer les données
- Vous devrez utiliser la fonction `GROUP BY` pour regrouper les données par article
- Vous terminerez par `ORDER BY`

## 19. Lister les quantités vendues de chaque article pour les années 2014, 2015, 2016.

```mysql

```

- Vous devrez partir de la table `ventes`
- Vous devrez faire la somme des quantités vendues avec la fonction `SUM` dans le `SELECT`
- Vous devrez faire une jointure avec la table `article`
- Vous devrez utiliser la clause `WHERE` pour filtrer les données sur les années, avec `BETWEEN`
- Vous devrez utiliser la fonction `GROUP BY` pour regrouper les données par article et par année
- Vous terminerez par `ORDER BY`
