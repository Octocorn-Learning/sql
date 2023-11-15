---
title: Procédures stockées et Triggers
theme: solarized
author: Alexandre Devos
company: Octocorn
contributors:
  - Alexandre Devos
sources:
  - 
---

# SQL - Procédures stockées

![SQL](./assets/sql.png) <!-- .element width="30%" align="left" -->

![MySQL](./assets/mysql.png) <!-- .element width="30%" align="right" -->

----

## Procédure stockées

### Définition

- Une procédure stockée est une suite d'instructions SQL qui peut être appelée par un nom.

- Elle peut prendre des paramètres en entrée et retourner des valeurs.

- Elle peut être appelée depuis une application ou depuis une autre procédure stockée.

> C'est une fonction, mais en SQL !

----

## Procédures stockées

### Exemple

```mysql
## Remplacement du délimiteur
DELIMITER |
# Déclaration de la procédure
CREATE PROCEDURE get_eleve_by_name
    # Liste des variables
    (IN name VARCHAR(45))
# Début du code de la procédure
BEGIN
    SELECT nom, prenom
    FROM eleves
    WHERE nom = name;
# Fin du code, et fin de l'instruction via le délimiteur
END |
# Remise du délimiteur par défaut
DELIMITER ;

# Appel du code
CALL get_eleve_by_name('Europe');
```

> Exemple tiré de [sql.sh](https://sql.sh/cours/procedure-stockee)

----

## Procédures Stockées

### `DELIMITER`

- `DELIMITER` permet de définir un nouveau délimiteur pour les instructions SQL.

- Par défaut, le délimiteur est `;`.

- Il est nécessaire de changer le délimiteur pour pouvoir définir une procédure stockée.

- Si nous ne le faisons pas, MySQL considérera que la procédure est terminée à la première instruction `;`.

----

## Procédures stockées

### `IN`, `OUT`, `INOUT`

- `IN` : Paramètre d'entrée

- `OUT` : Paramètre de sortie

- `INOUT` : Paramètre d'entrée et de sortie

----

## Procédures stockées

### Exemple plus complet

Si nous voulons modifier la classe d'un élève

```mysql
DELIMITER |

CREATE PROCEDURE change_classe
    (IN name VARCHAR(45), IN classe VARCHAR(45), OUT classe_id INT)
BEGIN
    SELECT id INTO classe_id
    FROM classes
    WHERE nom = classe;

    UPDATE eleves
    SET classe_id = classe_id
    WHERE nom = name;
END |

DELIMITER ;
```

----

## Procédures stockées

### Un peu plus que des `SELECT`

- Les procédures stockées peuvent contenir des instructions `SELECT`, mais aussi `INSERT`, `UPDATE`, `DELETE`, ...

- Elles peuvent aussi contenir des instructions de contrôle de flux (`IF`, `CASE`, ...)

----

## Procédures stockées

### Exemple plus complet

```mysql

DELIMITER |

CREATE PROCEDURE change_classe
    (IN name VARCHAR(45), IN classe VARCHAR(45), OUT classe_id INT)
BEGIN
    SELECT id INTO classe_id
    FROM classes
    WHERE nom = classe;

    UPDATE eleves
    SET classe_id = classe_id
    WHERE nom = name;

    IF classe_id IS NULL THEN
        INSERT INTO classes (nom, annee) VALUES (classe, YEAR(NOW()));
        SELECT LAST_INSERT_ID() INTO classe_id;
    END IF;
END |

DELIMITER ;
```

----

## Procédures stockées

### Les limites

- Les procédures stockées ne sont pas portables !

- Elles sont spécifiques à un SGBD (ici, MySQL)

- Elles ne sont pas compatibles avec les autres SGBD

----

## Procédures stockées

### Responsabilités

- La responsabilité de la base de données est de stocker et de gérer les données.

- La responsabilité de l'application est de gérer les traitements.

- Les procédures stockées sont des traitements, et donc la responsabilité de l'application.

----

## Procédures stockées

### Pourquoi les utiliser ?

- Les procédures stockées peuvent **dépanner** en cas de problème d'application.

- Elles peuvent être utiles pour les **extracts** de données manuelles, par exemple

- Elles ne **doivent pas** se substituer à l'application (API)

----

## Procédures stockées

### Les problèmes

- Les procédures stockées sont **difficiles à débugger et maintenir**.

- Elles alourdissent la base de données.

- Si on change de SGBD, il faut **tout réécrire** !

---

## Triggers

### Définition

- Un trigger est un **événement** qui se déclenche lorsqu'une action est effectuée sur une table.

- Il est possible de déclencher un trigger sur une action `INSERT`, `UPDATE` ou `DELETE`.

- Il est possible de déclencher un trigger **avant** ou **après** l'action.


----

## Triggers

### Syntaxe

```mysql
DELIMITER |

CREATE TRIGGER [TRIGGER_NAME]
[TRIGGER TIME] [TRIGGER EVENT]
ON [TABLE]
FOR EACH ROW
[TRIGGER BODY]|

DELIMITER ;
```

> Exemple tiré de [ce site](https://www.digitalocean.com/community/tutorials/how-to-manage-and-use-mysql-database-triggers-on-ubuntu-18-04-fr)

----

## Triggers

### Exemple

Vérifier si l'année de la classe est égale ou supérieure à l'année en cours

```mysql
DELIMITER |

CREATE TRIGGER check_year
BEFORE INSERT ON classes
FOR EACH ROW
BEGIN
    IF YEAR(NEW.annee) < YEAR(NOW()) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'L''année doit être égale ou supérieure à l''année en cours';
    END IF;
END |

DELIMITER ;
```

----

## Triggers

### Les limites

- Comme pour les procédures stockées, ils sont difficiles voir impossible à transférer d'un SGBD à un autre.

- Ils sont difficiles à tester (car déclenchés par une action sur la base de données)

- Ils sont difficiles à maintenir

- Ils alourdissent la base de données

----

## Triggers

### Toujours une question de responsabilité

- Les triggers sont des traitements, et donc la responsabilité de l'application.

- Ils ne doivent pas se substituer à l'application (API)

----

## Triggers

### Quelques Use Cases

Il y a tout de même quelques cas où les triggers peuvent être utiles :

- Backup de données automatiques avant une modification

- Gestion de larges volumes de données (lots)

- Gestion de la sécurité (logs, ...)

----

## Triggers

### En définitive

- Les triggers en eux mêmes ne sont pas mauvais.

- Ce qu'on en fait peut l'être !