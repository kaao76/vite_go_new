# MCD Vite & Gourmand : entités, phrases de l'énoncé et justifications

22/11/2026

Douze entités sont retenues pour le MCD. Chacune est justifiée par une phrase de l'énoncé (page indiquée) et par un besoin de stockage précis.

## Les 12 entités retenues

| Entité | Phrase de l'énoncé (page) | Justification |
| --- | --- | --- |
| **UTILISATEUR** | « Un visiteur peut se créer un compte » : nom, prénom, GSM, adresse mail et postale, mot de passe (p. 5) | Les informations du compte doivent être conservées pour la connexion, le pré-remplissage des commandes et l'envoi des mails |
| **ROLE** | « la connexion sera possible uniquement pour les employé, administrateur et utilisateurs » (p. 4) ; « il lui sera confié le rôle de utilisateur » (p. 5) | Trois profils qui déterminent l'espace et les actions autorisées ; l'annexe 1 prévoit aussi cette entité |
| **MENU** | « un menu dispose des caractéristiques suivantes : un titre, une galerie d'image, une description… stock disponible » (p. 4) | Objet central de l'application : consulté, filtré et commandé par le client |
| **THEME** | « Thème (Noel, Pâques, classique, évènement) » et « Filtre par thème » (p. 4-5) | Liste de valeurs partagée entre menus, modifiable par l'employé, utilisée par un filtre |
| **REGIME** | « Un Regime (vegetarien, vegan, classique) : vous pouvez alimenté d'avantage cette catégorie » (p. 4) et « Filtre sur un régime » (p. 5) | Même logique que le thème ; le sujet prévoit explicitement de l'enrichir |
| **IMAGE** | « Une galerie d'image » (p. 4) | Un menu a plusieurs images ; un seul champ ne peut pas les contenir proprement |
| **PLAT** | « Une liste de plat possible (entrée, plat ainsi que dessert) » ; « Une entrée ou un plat / dessert peuvent être présent dans plusieurs menus » (p. 4) | Un plat est réutilisé dans plusieurs menus : relation plusieurs-à-plusieurs avec le menu |
| **ALLERGENE** | « Chaque plat peut posséder une liste d'allergènes » (p. 4) | Relation plusieurs-à-plusieurs avec le plat ; information de sécurité alimentaire |
| **COMMANDE** | « Il est possible de commander un menu » : adresse, date et heure de prestation, livraison (5 € + 0,59 €/km hors Bordeaux), nombre de personnes, réduction de 10 % (p. 7) ; prêt de matériel (p. 8) | Transaction centrale ; les prix sont figés au moment de l'achat pour ne pas changer rétroactivement |
| **STATUT** | « Le suivi de la commande énumère tous les états de sa commande suivi de la date et l'heure de modification » (p. 7) ; liste des états (p. 8) | Il faut un historique complet des états ; une colonne unique ne garderait que le dernier |
| **AVIS** | « Il doit pouvoir donner entre note entre 1 et 5, suivi d'un commentaire » (p. 7) ; l'employé valide ou refuse les avis (p. 8) | Cycle de vie propre (en attente, validé, refusé) ; affiché sur l'accueil une fois validé |
| **HORAIRE** | « Les horaires doivent être visible sur le pied de page, du lundi au dimanche » (p. 4) ; l'employé peut modifier les horaires (p. 8) | Données qui changent, modifiables sans toucher au code |

## Entités écartées et choix discutables

| Candidat | Décision | Raison |
| --- | --- | --- |
| **Contact** | Écartée | L'énoncé dit que la demande est envoyée par mail (p. 9) ; rien à relire en base. Alternative défendable : la stocker pour garder une trace. |
| **Espace** (utilisateur, employé, administrateur) | Écartée | Ce sont des zones de l'application, déterminées par le rôle ; aucune ligne à enregistrer. |
| **Membre équipe** | Discutable | L'énoncé demande de mettre en avant le professionnalisme de l'équipe (p. 3) sans préciser noms, postes ou photos. Une entité (membre_id, nom, prénom, poste, photo) permettrait de modifier l'équipe sans toucher au code, mais n'est pas exigée. |
| **Role** | Retenue, discutable | Pourrait être une colonne de UTILISATEUR (3 valeurs) ; gardée en entité car plus évolutive et présente dans l'annexe 1. |
| **Statut** | Retenue | Une colonne ne suffit pas pour l'historique daté demandé p. 7. Absente de l'annexe 1. |
| **Image** | Retenue | Plusieurs images par menu ; absente de l'annexe 1. |

## Questions à poser au professeur

- [ ] « Mise en avant du professionnalisme de l'équipe » : un simple texte suffit-il, ou faut-il afficher les membres (nom, poste, photo) ?
- [ ] Les messages du formulaire de contact doivent-ils être enregistrés en base, ou l'envoi par mail suffit-il ?
- [ ] Pour le prix d'un menu : stocker le prix pour le nombre minimum de personnes (énoncé) ou un prix par personne (annexe 1) ?
- [ ] Le rôle peut-il rester une entité, ou vaut-il mieux une colonne dans l'utilisateur ?
- [ ] La distance en kilomètres, nécessaire au prix de livraison, doit-elle être conservée dans la commande ?
