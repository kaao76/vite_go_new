# Vite & Gourmand

Application web pour l'entreprise de traiteur « Vite & Gourmand » (Bordeaux) : présentation des menus, commande en ligne, suivi des commandes, espaces employé et administrateur.

Projet réalisé dans le cadre de l'ECF Studi « Développeur Web et Web Mobile ».

## Technologies

- PHP natif, programmation orientée objet
- Base de données relationnelle : MySQL / MariaDB
- Base de données NoSQL : MongoDB (à venir)
- HTML, CSS, JavaScript
- Serveur local : XAMPP

## Liens du projet

- Application déployée : _à compléter_
- Tableau Jira : _à compléter_
- Dépôt GitHub : _à compléter_

## Structure du dépôt

| Dossier | Contenu |
|---|---|
| `public/` | Seul dossier accessible par le navigateur : page d'entrée, CSS, JavaScript, images |
| `src/` | Code PHP : contrôleurs, modèles, vues |
| `config/` | Réglages de l'application (la connexion à la base n'est jamais envoyée sur GitHub) |
| `database/` | `create.sql` (création des tables) et `data.sql` (données de départ) |
| `docs/` | Documentation : conception (MCD, MLD), manuel d'utilisation, charte graphique, documentation technique |

## Installation en local

1. Installer XAMPP, puis démarrer Apache et MySQL.
2. Copier le projet dans le dossier `htdocs` de XAMPP.
3. Dans phpMyAdmin, importer `database/create.sql`, puis `database/data.sql`.
4. Créer le fichier `config/config.php` avec les identifiants de la base (modèle à ajouter).
5. Ouvrir `http://localhost/VG/public/` dans le navigateur.

## Comptes de test

Ces comptes sont créés par `database/data.sql`. Ils sont destinés au développement et seront remplacés avant la mise en production.

| Rôle | Email | Mot de passe |
|---|---|---|
| Administrateur | admin@vitegourmand.fr | Admin2026! |
| Employé | employe@vitegourmand.fr | Employe2026! |
| Client | client@exemple.fr | Client2026! |

## Organisation du travail

- `main` : version stable, destinée au déploiement.
- `develop` : version de travail, où les nouveautés sont assemblées.
- `feature/...` : une branche par fonctionnalité, créée depuis `develop`.
- Les messages de commit commencent par le numéro du ticket Jira, par exemple `VG-12 Initialisation du projet`.
