## Docker

Si vous avez déjà vu Docker, créez via docker un conteneur MySQL et importez le fichier `beer.sql` dans votre conteneur.

Si vous n'avez pas encore vu Docker, importez le fichier `beer.sql` dans votre base de données MySQL ou demandez à votre
formateur de vous aider ou de vous donner le docker-compose.

### Prérequis

- Vous devez avoir un dockerfile et un docker-compose.yml
- Vous ne devez pas utiliser de `bind mount` !
- Vous avez le droit d'utiliser un `volume`

## Etude du modèle

### Effectuez un reverse engineering du modèle

- Quelles sont les tables ?

### Il y a des mauvaises pratiques dans ce modèle, lesquelles ?

- Regardez bien les tables et les colonnes, vous devriez trouver des choses qui ne vont pas

## Exercices

Réalisez les requêtes suivantes :

### Quels sont les tickets qui comportent l’article d’ID 500, afficher le numéro de ticket uniquement ?

```mysql

```

- La table qui vous intéresse est la table `ventes`
- Il n'y a pas de jointure à faire : tout est déjà dans la table `ventes`
- Vous devrez utiliser une clause `WHERE`
- S'agissant d'un nombre, vous devrez utiliser un `=`

### Afficher les tickets du 15/01/2014.

```mysql

```

- La requête est très similaire à la précédente
- Vous devrez rechercher sur la table `ticket`

### Afficher les tickets émis du 15/01/2014 et le 17/01/2014.

```mysql

```

- La requête est très similaire à la précédente
- Vous aurez besoin de la clause `BETWEEN` pour cette requête
- Vous devrez rechercher sur la table `ticket`

Rappel de la syntaxe de la clause `BETWEEN` :
```mysql
BETWEEN 'x' AND 'y'
```

### Editer la liste des articles apparaissant à 50 et plus exemplaires sur un ticket.

```mysql

```

- La table qui vous intéresse est la table `ventes`
- Vous devrez faire une jointure avec la table `article`
- Vous devrez utiliser une clause `WHERE`
- Vous pouvez utiliser le token `>=` pour cette requête

### Quelles sont les tickets émis au mois de mars 2014.

```mysql

```

- La table qui vous intéresse est la table `ticket`
- Vous devrez utiliser une clause `WHERE` et la fonction `MONTH` et `YEAR`


### Quelles sont les tickets émis entre les mois de mars et avril 2014 ?

```mysql

```

- La table qui vous intéresse est la table `ticket`
- Vous devrez utiliser une clause `WHERE` et la fonction `MONTH`
- Vous devrez utiliser la clause `IN` pour cette requête

### Quelles sont les tickets émis au mois de mars et juin 2014 ?

```mysql

```

- Très similaire à la précédente, mais avec des mois différents

### Afficher la liste des bières classée par couleur. (Afficher l’id et le nom)

```mysql

```

- La table qui vous intéresse est la table `article`
- Vous aurez besoin d'une jointure avec la table `couleur`
- Vous devrez utiliser la clause `ORDER BY` pour cette requête

### Afficher la liste des bières n’ayant pas de couleur. (Afficher l’id et le nom)

```mysql

```

- La table qui vous intéresse est la table `article`
- Il n'y a pas de jointure
- Vous devrez utiliser la clause `WHERE` et la fonction `IS NULL` pour cette requête
