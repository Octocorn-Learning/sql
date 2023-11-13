## 10 Listez pour chaque ticket la quantité totale d’articles vendus. (Classer par quantité décroissante)

```mysql

```

- Vous aurez besoin de la fonction `SUM`



## 11 Listez chaque ticket pour lequel la quantité totale d’articles vendus est supérieure à 500. (Classer par quantité décroissante)

```mysql
```

- Vous devrez utiliser la fonction `GROUP BY`
- Vous devrez utiliser `ORDER BY`

## 12 Listez chaque ticket pour lequel la quantité totale d’articles vendus est supérieure à 500. On exclura du total, les ventes ayant une quantité supérieure à 50 (classer par quantité décroissante)

```mysql
```

- Vous réaliserez la somme des quantités vendues avec la fonction `SUM` dans le `SELECT`

## 13 Listez les bières de type ‘Trappiste’. (id, nom de la bière, volume et titrage)

```mysql
```

- Vous devrez faire une jointure avec la table `type`

## 14 Listez les marques de bières du continent ‘Afrique’

```mysql

```

- Vous devrez faire deux jointures

## 15 Lister les bières du continent ‘Afrique’

```mysql
```

- Vous devrez faire trois jointures

## 16. Lister les tickets (année, numéro de ticket, montant total payé). En sachant que le prix de vente est égal au prix d’achat augmenté de 15%.

```mysql

```

- Vous devrez faire un `SUM` sur la quantité multipliée par le prix d'achat, et ajouter 15% 
- Vous devrez faire deux jointures

> Vous aurez certainement besoin du mot `USING` dans votre requête.

## 17  Donner le C.A. par année.

```mysql
```

- Vous devrez faire la somme des quantités multipliées par le prix d'achat, et ajouter 15% au résultat (*1.15)

## 18. Lister les quantités vendues de chaque article pour l’année 2016.

```mysql

```

- Vous devrez faire une jointure

## 19. Lister les quantités vendues de chaque article pour les années 2014, 2015, 2016.

```mysql

```

- Vous devrez faire la somme des quantités vendues avec la fonction `SUM` dans le `SELECT`
