# Conseils de rédaction

## Structure 🌳

```bash
root
|   exercices # Répertoire contenant les exercices
|   |   01_exercice # Répertoire contenant l'exercice 01
|   |   |   01_exercice.poussin.md 
|   |   |   01_exercice.poulet.md
|   |   |   01_exercice.coq.md
|   cours # Répertoire contenant les cours
|   |   00_index.slides.md # Table des matières
|   |   01_cours.slides.md # Cours 01
```

## Nomenclature 🏷️

> ⚠️ Chaque nouveau chapitre doit être ajouté à la table des matières (`00_index.slides.md`) ⚠️

### Cours 📖

- Les fichiers sont placés dans le répertoire `./cours`
- Ils sont suffixés par `.slides.md`

A la fin de chaque chapitre, ajoutez : 

```markdown
---

# La suite !

- [Index](index.html)
```

#### Slides

Pour ajouter une slide horizontale

```markdown
---

```

Pour ajouter une slide verticale

```markdown
----

```

Mettre en valeur du mot dans une balise de code

```markdown
  ```langage [1]
    mot 0
    mot mis en valeur
    ```
```

Pour le reste, utilisez la syntaxe markdown !

### Exercices ✊

- Les fichiers sont placés dans le répertoire `./exercices`
- On compte un répertoire par exercice
- Le niveau de difficulté (poussin, poulet ou coq) de l'exercice est précisé en suffixe : `01_exercice.poussin.md`

> Si vous souhaitez ajouter les sources d'un exercice, préciser le lien vers le dépot afin que je puisse le fork sur l'organisation.
 
### Corrections et démonstrations 👆

- Les corrections et démonstrations sont placées dans le répertoire `./espace formateur`
- Il s'agit d'un submodue git pointant vers un autre dépôt privé contenant des : 
    - corrections des exercices
    - guides pour les démonstrations
    - ressources supplémentaires