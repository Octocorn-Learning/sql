---
title: Template
theme: solarized
author: Alexandre Devos
company: Octocorn
contributors:
  - Alexandre Devos
---

# Base de données

## Présentation

![SQL](./assets/sql.png) <!-- .element width="30%" align="left" -->

![MySQL](./assets/mysql.png) <!-- .element width="30%" align="right" -->

----

## Définition

Une base de données est un ensemble d’information structuré et accessible au moyen d’un logiciel.
Source : Le Dictionnaire Le Robert

----

## Objectifs

- Stocker des informations sous forme de tableau
- Lier des informations entre elles
- Manipuler et accéder aux informations
- Pour ce faire, on utilise un **SGBD**

> Comparable à Excel (sous stéroïdes)

----

## SGBD

### Définition

- **S**ystème de **G**estion de **B**ase de **D**onnées
- Désigne le programme qui permet la manipulation d'une BDD
- Exemples :
    - MySQL
    - MariaDB
    - PostgreSQL
    - Oracle Database
    - etc.

----

## BDD

### Contenu

- **Tables** : Ensemble de données (tableaux Excel)
- **Clefs Primaires** : Identifiants uniques (ID)
- **Contraintes** : Règles de validation des données
- **Relations** : Liens entre les tables

> Comparable à un tableau croisé dynamique dans Excel

----

## SGBD

### Différents moteurs

- **moteur** désigne l'algorithme permettant de stocker/manipuler les données
- MySQL laisse le choix du moteur : **InnoDB** ou **MyISAM**

> Il en existe [beaucoup d'autres](https://en.wikipedia.org/wiki/Database_engine) !

----

## BDD

### Exemple de contenu

| ID | Nom       | Prénom  | Date de Naissance | Métier   |
|----|-----------|---------|-------------------|----------|
| 1  | Mercury   | Freddie | 05/09/1946        | Chanteur |
| 2  | Kilmister | Lemmy   | 24/12/1945        | Bassiste |
| 4  | Bowie     | David   | 08/01/1947        | Chanteur |
| 5  | Hudson    | Saul    | 23/07/1946        | Bassiste |

Ici, on peut voir que certaines informations se répètent (Métier).

----

## BDD

### Exemple de contenu

Avec SQL, on pourra lier les informations entre elles :

| ID | Intitulé |
|----|----------|
| 1  | Chanteur |
| 2  | Bassiste |

----

## BDD

### Exemple de contenu

| ID | Nom       | Prénom  | Date de Naissance | Métier |
|----|-----------|---------|-------------------|--------|
| 1  | Mercury   | Freddie | 05/09/1946        | **1**  |
| 2  | Kilmister | Lemmy   | 24/12/1945        | **2**  |
| 4  | Bowie     | David   | 08/01/1947        | **1**  |
| 5  | Hudson    | Saul    | 23/07/1946        | **2**  |

Ici, on fera référence à la table `Intitulé` pour savoir quel est le métier de chaque personne.

----

## BDD

### Langage

- Le langage utilisé pour manipuler les BDD est le **SQL** (Structured Query Language)
- Il existe plusieurs dialectes de SQL, mais ils sont tous très similaires
- On peut utiliser le SQL dans un SGBD, mais aussi dans un langage de programmation

----

## BDD

### Autrement dit ...

- Une BDD est un ensemble de tables comparables à des tableaux Excel
- Le langage SQL permet de manipuler ces tableaux
- On s'en servira pour ajouter, modifier, lire et supprimer et filtrer des données... Et parfois tout ça en même temps !

----

## BDD

### Algebre relationnelle

- On parle souvent des BDD de type SQL comme étant **relationnelles**
- On ne désigne pas la présence de relations ici, mais l'**algèbre relationnelle**

> Quelques infos [ici](https://fr.wikipedia.org/wiki/Alg%C3%A8bre_relationnelle)

----

## SQL

### Avantages

- Langage relativement simple
- Très répandu
- Permet de manipuler les BDD de manière simple et efficace

---

## SQL

### Les types

![SQL](./assets/sql.png) <!-- .element width="30%" align="left" -->

![MySQL](./assets/mysql.png) <!-- .element width="30%" align="right" -->

----

## SQL

### Nombres entiers

| Type      | Description                                  |
|-----------|----------------------------------------------|
| TINYINT   | -128 à 127                                   |
| SMALLINT  | -32768 à 32767                               |
| MEDIUMINT | -8388608 à 8388607                           |
| INT       | -2147483648 à 2147483647                     |
| BIGINT    | -9223372036854775808 à + 9223372036854775807 |

----

## SQL

### Nombres entiers

- On peut préciser l'argument `UNSIGNED`, qui indique que notre nombre sera toujours positif.
- Le minimum passe à zero et le maximum 'double' en conséquence. (ex : TINYINT UNSIGNED = 0 à 255)

----

## SQL

### Nombres flottants (avec des virgules)

| Type    | Description            |
|---------|------------------------|
| FLOAT   | 23 chiffres            |
| DOUBLE  | 24 à 53 chiffres       |
| DECIMAL | = "double" type STRING |

> DECIMAL peut contenir jusqu'à 5 chiffres significatifs : 2 avant la virgule et 3 après

----

## SQL

### Chaines de caractères

| Type           | Description      |
|----------------|------------------|
| **CHAR**(x)    | (x) = taille     |
| **VARCHAR**(x) | taille = (x) + 1 |
| **TINYTEXT**   | 2^8 caractères   |
| **TEXT**       | 2^16  caractères |
| **MEDIUMTEXT** | 2^24  caractères |
| **LONGTEXT**   | 2^32  caractères |

----

## SQL

### Question

Quel serait le type du livre "Les Misérables" de Victor Hugo ?

----

## SQL

### Réponse

- LONGTEXT

> "Les Misérables" fait env. 500K mots (env. 3 millions de caractères)

----

## SQL

### Les tailles

- S'il y a autant de types, c'est pour permettre d'optimiser la taille de la BDD
- Plus la taille est petite, plus la BDD sera rapide
- Mais attention à ne pas être trop restrictif !

----

## SQL

### Exemple avec CHAR(10)

| Input :             | CHAR(10)     | Octets |
|---------------------|--------------|--------|
| ""                  | "__________" | 10     |
| "Lic"               | "Lic_______" | 10     |
| "Licorne"           | "Licorne___" | 10     |
| "Vive les licornes" | "Vive les l" | 10     |

> La taille de la base est stable, mais plus volumineuse

----

## SQL

### Exemple avec VARCHAR(10)

| Input :             | VARCHAR(10)  | Octets |
|---------------------|--------------|--------|
| ""                  | ""           | 1      |
| "Lic"               | "Lic"        | 4      |
| "Licorne"           | "Licorne"    | 8      |
| "Vive les licornes" | "Vive les l" | 11     |

> La taille de la base est moins volumineuse, mais plus variable

----

## SQL

### Les dates

| Type      | Spécification       |
|-----------|---------------------|
| DATE      | YYYY-MM-DD          |
| DATETIME  | YYYY-MM-DD HH:MM:SS |
| TIME      | HH:MM:SS            |
| YEAR      | YYYY                |
| TIMESTAMP | YYYYMMDDHHMMSS      |

----

## SQL

### Les dates

Il est aussi possible de stocker les dates sous forme de `UNIX_TIMESTAMP` :

Il représente le nombre de secondes écoulées depuis le 01/01/1970 à 00:00:00

> Le timestamp du 20/07/1992 : 711302400

---

## MySQL
### Installation

![SQL](./assets/sql.png) <!-- .element width="30%" align="left" -->

![MySQL](./assets/mysql.png) <!-- .element width="30%" align="right" -->

----

## MySQL

### Installation

- Il existe plusieurs manières d'installer MySQL
- L'installer directement sur son ordinateur
- On peut aussi utiliser [Docker](https://www.docker.com/)

----

## MySQL

### Installation via Docker

Avantages :

- Installation facile et rapide
- Pas besoin de le désinstaller une fois fini
- Ne laisse pas de traces sur l'ordinateur
- Consomme peu de ressources et moins d'espace disque !

----

## MySQL
### Prérequis

- Installer [Docker](https://www.docker.com/)
- Installer [MySQL Workbench](https://www.mysql.com/fr/products/workbench/)

----

## MySQL

### Installation via Docker

```docker-compose
version: '3.9'

services:
  db:
    image: mysql:5.7
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: db
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    ports:
      - 3306:3306
    volumes:
      - mysql-data:/var/lib/mysql
volumes:
  mysql-data:
```

`docker-compose up`

----

## MySQL

### Connexion via MySQL Workbench

- On peut se connecter à la BDD via MySQL Workbench
- Cliquer sur `+` pour ajouter une nouvelle connexion
- Remplir les champs comme ceci :
  - Hostname : `127.0.0.1`
  - User : `user`
  - Password : `password`

> Si après avoir cliqué sur "Test Connection" tout est OK, validez !

----

## MySQL

### Connexion via IntelliJ

- On peut aussi se connecter à la BDD via IntelliJ ou VS Code
- Installez le module SQL
- Créez une nouvelle connexion
- Remplissez les mêmes champs que précédemment

> Nous allons d'abord utiliser MySQL Workbench pour manipuler la BDD

---

# La suite !

[Index](index.html)