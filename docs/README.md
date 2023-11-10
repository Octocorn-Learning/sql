# Documentation technique

## Installation

### Prérequis

- [Node.js](https://nodejs.org/en/)

### Installation des dépendances

Il faut installer `reveal-md` pour pouvoir visualiser les slides en local.
L'installation doit être faite en global.

```bash
npm i -g reveal-md
```

## Utilisation

### Visualisation des slides

Pour visualiser les slides, il faut lancer la commande suivante :

```bash
reveal-md 00_index.slides.md
```

### Générer un site statique

```bash
reveal-md ./ --static --glob '*.slides.md'
```

### Exporter en PDF

1. Ouvrir les slides dans le navigateur
2. Ajouter `?print-pdf` à la fin de l'URL : `http://localhost:1948/01_template.slides.md?print-pdf`