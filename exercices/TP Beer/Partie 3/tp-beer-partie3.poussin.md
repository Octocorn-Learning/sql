# TP Beez - Partie 3

> Vous devrez utiliser des sous requêtes pour toutes les questions !

## 20. Listez les articles qui n’ont fait l’objet d’aucune vente en 2014.

```mysql

```

- Vous devrez partir de la table `article`
- Vous aurez besoin d'une sous requête dans le `WHERE`, afin de récupérer les ventes de l'article en 2014
- Vous devrez utiliser la fonction `SUM` dans la sous requête
- Vous devrez utiliser la fonction `IS NULL` dans la sous requête

## 21. Codez de 2 manières différentes la requête suivante : Listez les pays qui fabriquent des bières de type ‘Trappiste’.

### Méthode 1 - Avec jointure

```mysql

```

- Vous devrez partir de la table `pays
- Vous devrez faire une jointure avec la table `marque`
- Vous devrez faire une jointure avec la table `article`
- Vous devrez faire une jointure avec la table `type`
- Vous devrez utiliser la clause `WHERE` pour filtrer les données

### Méthode 2 - Avec sous Requête

```mysql

```

- Vous devrez partir de la table `pays`
- Vous devrez utiliser une sous requête dans le `WHERE`, afin de récupérer les pays qui fabriquent des bières de type ‘Trappiste’
    - Votre sous requête aura besoin de 2 sous requêtes : une pour récupérer l'ID_PAYS de la marque, et une pour récupérer l'ID_TYPE de la bière
    - La première sera dans le `SELECT`, la seconde dans le `WHERE`
- Vous devrez utiliser la fonction `IN` dans la sous requête

> Si vous rencontrez trop de difficultés sur cette question, passez la pour y revenir plus tard

## 22. Listez les tickets sur lesquels apparaissent un des articles apparaissant aussi sur le ticket 2014-856.

```mysql

```

- Vous devrez partir de la table `ventes`
- Vous devrez utiliser une sous requête dans le `WHERE`, afin de récupérer les articles du ticket 2014-856

> N'oubliez pas que `IN` peut être utilisé sur une sous requête dans le `WHERE` qui retourne plusieurs lignes

## 23. Listez les articles ayant un degré d’alcool plus élevé que la plus forte des trappistes.

```mysql

```

- Vous devrez partir de la table `article`
- Vous devrez réaliser une sous requête dans le `WHERE`, afin de récupérer le titrage de la plus forte des trappistes
- Vous devrez utiliser la fonction `MAX` dans la sous requête
- Votre sous requête aura besoin d'une sous requête pour récupérer l'ID_TYPE de la bière
- Vous devrez utiliser la fonction `ORDER BY` dans la requête principale

## 24. Editez les quantités vendues pour chaque couleur en 2014.

```mysql

```

- Vous devrez partir de la table `couleur`
- Vous devrez réaliser une sous requête dans le `SELECT`, afin de récupérer les quantités vendues pour chaque couleur en 2014
- Vous devrez utiliser la fonction `SUM` dans la sous requête
- Vous devrez utiliser la fonction `IN` dans la sous requête
- Votre sous requête aura besoin d'une sous requête pour récupérer les ID_ARTICLE de la couleur

## 25. Donnez l’ID, le nom, le volume et la quantité vendue des 20 articles les plus vendus en 2016.

```mysql

```

- Vous devrez partir de la table `article`
- Vous devrez réaliser une sous requête dans le `SELECT`, afin de récupérer les quantités vendues pour chaque article en 2016
- Vous devrez utiliser la fonction `SUM` dans la sous requête

## 26. Donner l’ID, le nom, le volume et la quantité vendue des 5 ‘Trappistes’ les plus vendus en 2016.

```mysql

```

- Le début de la requête est identique à la précédente
- Il faut juste y ajouter une clause `WHERE` pour filtrer les données
- La clause `WHERE` aura besoin d'une sous requête pour récupérer l'ID_TYPE de la bière

----

# Pour les plus à l'aise

Si vous avez terminé, rendez-vous sur la partie 4 !


