-- Vite & Gourmand : données de départ (jeu d'essai)
-- À importer APRÈS create.sql.

USE vite_gourmand;

-- 1. Rôles (énoncé : utilisateur, employe, Administrateur)
INSERT INTO Role (Role_id, Libelle) VALUES
(1, 'utilisateur'),
(2, 'employe'),
(3, 'administrateur');

-- 2. Statuts d'une commande (énoncé p.8 + "en attente" avant acceptation + "annulée")
INSERT INTO Statut (Statut_id, Libelle) VALUES
(1, 'en attente'),
(2, 'accepté'),
(3, 'en préparation'),
(4, 'en cours de livraison'),
(5, 'livré'),
(6, 'en attente du retour de matériel'),
(7, 'terminée'),
(8, 'annulée');

-- 3. Thèmes (énoncé : Noël, Pâques, classique, évènement)
INSERT INTO Theme (Theme_id, Libelle) VALUES
(1, 'Noël'),
(2, 'Pâques'),
(3, 'classique'),
(4, 'évènement');

-- 4. Régimes (énoncé : végétarien, vegan, classique)
INSERT INTO Regime (Regime_id, Libelle) VALUES
(1, 'classique'),
(2, 'végétarien'),
(3, 'vegan');

-- 5. Allergènes (14 allergènes à déclaration obligatoire en Europe)
INSERT INTO Allergene (Allergene_id, Libelle) VALUES
(1, 'gluten'),
(2, 'crustacés'),
(3, 'œufs'),
(4, 'poissons'),
(5, 'arachides'),
(6, 'soja'),
(7, 'lait'),
(8, 'fruits à coque'),
(9, 'céleri'),
(10, 'moutarde'),
(11, 'sésame'),
(12, 'sulfites'),
(13, 'lupin'),
(14, 'mollusques');

-- 6. Horaires du pied de page (lundi au dimanche) - heures à adapter
INSERT INTO Horaire (Horaire_id, Jour, Heure_ouverture, Heure_fermeture) VALUES
(1, 'lundi',    '09:00:00', '18:00:00'),
(2, 'mardi',    '09:00:00', '18:00:00'),
(3, 'mercredi', '09:00:00', '18:00:00'),
(4, 'jeudi',    '09:00:00', '18:00:00'),
(5, 'vendredi', '09:00:00', '18:00:00'),
(6, 'samedi',   '09:00:00', '13:00:00'),
(7, 'dimanche', NULL, NULL);

-- 7. Plats (type : entrée, plat, dessert)
INSERT INTO Plat (Plat_id, Nom, Type) VALUES
(1, 'Foie gras maison et chutney de figues', 'entrée'),
(2, 'Velouté de potimarron', 'entrée'),
(3, 'Chapon rôti aux marrons', 'plat'),
(4, 'Gratin dauphinois', 'plat'),
(5, 'Bûche chocolat noisette', 'dessert'),
(6, 'Salade de chèvre chaud', 'entrée'),
(7, 'Gigot d''agneau de Pâques', 'plat'),
(8, 'Tarte aux fraises', 'dessert'),
(9, 'Risotto aux champignons', 'plat'),
(10, 'Curry de légumes et lait de coco', 'plat'),
(11, 'Salade de fruits frais', 'dessert');

-- 8. Menus (prix_minimum = prix pour le nombre de personnes minimum)
INSERT INTO Menu (Menu_id, Titre, Description, Nb_personnes_minimum, Prix_minimum, Conditions, Quantite_restante, Theme_id, Regime_id) VALUES
(1, 'Menu de Noël traditionnel',
    'Un repas de fête complet : foie gras, chapon rôti et bûche maison.',
    6, 120.00,
    'À commander au moins 14 jours avant la prestation. Conserver au frais entre 0 et 4 °C.',
    10, 1, 1),
(2, 'Menu de Pâques',
    'Salade de chèvre chaud, gigot d''agneau et tarte aux fraises.',
    4, 80.00,
    'À commander au moins 7 jours avant la prestation. Conserver au frais.',
    8, 2, 1),
(3, 'Menu végétarien événement',
    'Un menu sans viande pour vos réceptions : velouté, risotto et salade de fruits.',
    8, 100.00,
    'À commander au moins 10 jours avant la prestation.',
    5, 4, 2),
(4, 'Menu vegan classique',
    'Un repas 100 % végétal : velouté, curry de légumes et salade de fruits.',
    4, 70.00,
    'À commander au moins 5 jours avant la prestation.',
    6, 3, 3);

-- 9. Images (chemins provisoires à remplacer par les vraies photos)
INSERT INTO Image (Image_id, Chemin, Texte_alternatif, Menu_id) VALUES
(1, '/assets/images/menus/noel-1.jpg', 'Table de Noël avec foie gras et bûche', 1),
(2, '/assets/images/menus/paques-1.jpg', 'Gigot d''agneau et tarte aux fraises', 2),
(3, '/assets/images/menus/vegetarien-1.jpg', 'Risotto aux champignons et velouté', 3),
(4, '/assets/images/menus/vegan-1.jpg', 'Curry de légumes et salade de fruits', 4);

-- 10. Composition des menus (association propose)
INSERT INTO propose (Plat_id, Menu_id) VALUES
(1, 1), (3, 1), (4, 1), (5, 1),
(6, 2), (7, 2), (8, 2),
(2, 3), (9, 3), (11, 3),
(2, 4), (10, 4), (11, 4);

-- 11. Allergènes des plats (association contient)
INSERT INTO contient (Allergene_id, Plat_id) VALUES
(1, 3), (9, 3),
(7, 4),
(1, 5), (3, 5), (7, 5), (8, 5),
(7, 6), (1, 6),
(7, 8), (1, 8), (3, 8),
(7, 9), (9, 9),
(12, 1), (10, 1);

-- 12. Comptes de test (mots de passe hachés avec password_hash de PHP, bcrypt)
--     administrateur : admin@vitegourmand.fr / Admin2026!
--     employé        : employe@vitegourmand.fr / Employe2026!
--     client         : client@exemple.fr / Client2026!
--     À CHANGER avant le déploiement final.
INSERT INTO Utilisateur (Utilisateur_id, Nom, Prenom, Email, Mot_de_passe, Telephone, Adresse, Code_postal, Ville, Pays, Actif, Reset_token, Reset_expire, Role_id) VALUES
(1, 'Admin', 'José', 'admin@vitegourmand.fr',
    '$2y$10$RI9CO4dmBOZdbmd7MlPdTurq0g1uH0pyc5bd3gVRxuYisQpSOWeY2',
    '0556000001', '10 rue Sainte-Catherine', '33000', 'Bordeaux', 'France', TRUE, NULL, NULL, 3),
(2, 'Employe', 'Julie', 'employe@vitegourmand.fr',
    '$2y$10$1GMQYGQp1ekDT8GpGHHgwe4xprA02iXJLZRM0cOKhirbP0VK9qaj.',
    '0556000002', '10 rue Sainte-Catherine', '33000', 'Bordeaux', 'France', TRUE, NULL, NULL, 2),
(3, 'Martin', 'Camille', 'client@exemple.fr',
    '$2y$10$JMm0kkxQUGOlcX6cbqVhB.SV9.gSajXo1wAB9F2GIyQTf2ta3kWAu',
    '0600000003', '25 cours de l''Intendance', '33000', 'Bordeaux', 'France', TRUE, NULL, NULL, 1);

-- 13. Une commande d'exemple terminée, avec son suivi et son avis
INSERT INTO Commande (Commande_id, Numero_commande, Date_commande, Date_prestation, Heure_livraison, Adresse_prestation, Ville_prestation, Distance_km, Nb_personnes, Prix_menu, Prix_livraison, Remise, Total, Pret_materiel, Materiel_restitue, Motif_annulation, Mode_contact, Menu_id, Utilisateur_id) VALUES
(1, 'VG-2026-0001', '2026-10-01', '2026-10-20', '12:00:00', '25 cours de l''Intendance', 'Bordeaux', 0.00, 6, 120.00, 0.00, 0.00, 120.00, FALSE, FALSE, NULL, NULL, 1, 3);

INSERT INTO suit (Statut_id, Commande_id, date_heure) VALUES
(1, 1, '2026-10-01 10:15:00'),
(2, 1, '2026-10-02 09:00:00'),
(3, 1, '2026-10-19 08:00:00'),
(4, 1, '2026-10-20 10:30:00'),
(5, 1, '2026-10-20 12:05:00'),
(7, 1, '2026-10-20 12:10:00');

INSERT INTO Avis (Avis_id, Note, Commentaire, Statut, Commande_id) VALUES
(1, 5, 'Repas délicieux et livraison à l''heure, merci !', 'validé', 1);
