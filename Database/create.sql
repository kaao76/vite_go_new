-- Vite & Gourmand : création de la base (MPD pour MySQL / MariaDB)
-- Généré depuis le MLD Looping, adapté pour MySQL.

CREATE DATABASE IF NOT EXISTS vite_gourmand
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE vite_gourmand;

CREATE TABLE Role (
   Role_id INT AUTO_INCREMENT,
   Libelle VARCHAR(30) NOT NULL,
   PRIMARY KEY (Role_id),
   UNIQUE (Libelle)
) ENGINE=InnoDB;

CREATE TABLE Theme (
   Theme_id INT AUTO_INCREMENT,
   Libelle VARCHAR(50) NOT NULL,
   PRIMARY KEY (Theme_id),
   UNIQUE (Libelle)
) ENGINE=InnoDB;

CREATE TABLE Regime (
   Regime_id INT AUTO_INCREMENT,
   Libelle VARCHAR(50) NOT NULL,
   PRIMARY KEY (Regime_id),
   UNIQUE (Libelle)
) ENGINE=InnoDB;

CREATE TABLE Allergene (
   Allergene_id INT AUTO_INCREMENT,
   Libelle VARCHAR(50) NOT NULL,
   PRIMARY KEY (Allergene_id),
   UNIQUE (Libelle)
) ENGINE=InnoDB;

CREATE TABLE Statut (
   Statut_id INT AUTO_INCREMENT,
   Libelle VARCHAR(50) NOT NULL,
   PRIMARY KEY (Statut_id),
   UNIQUE (Libelle)
) ENGINE=InnoDB;

CREATE TABLE Plat (
   Plat_id INT AUTO_INCREMENT,
   Nom VARCHAR(100) NOT NULL,
   Type VARCHAR(20) NOT NULL,
   PRIMARY KEY (Plat_id)
) ENGINE=InnoDB;

CREATE TABLE Menu (
   Menu_id INT AUTO_INCREMENT,
   Titre VARCHAR(100) NOT NULL,
   Description TEXT NOT NULL,
   Nb_personnes_minimum INT NOT NULL,
   Prix_minimum DECIMAL(8,2) NOT NULL,
   Conditions TEXT NOT NULL,
   Quantite_restante INT NOT NULL,
   Theme_id INT NOT NULL,
   Regime_id INT NOT NULL,
   PRIMARY KEY (Menu_id),
   FOREIGN KEY (Theme_id) REFERENCES Theme (Theme_id),
   FOREIGN KEY (Regime_id) REFERENCES Regime (Regime_id)
) ENGINE=InnoDB;

CREATE TABLE Horaire (
   Horaire_id INT AUTO_INCREMENT,
   Jour VARCHAR(10) NOT NULL,
   Heure_ouverture TIME,
   Heure_fermeture TIME,
   PRIMARY KEY (Horaire_id),
   UNIQUE (Jour)
) ENGINE=InnoDB;

CREATE TABLE Utilisateur (
   Utilisateur_id INT AUTO_INCREMENT,
   Nom VARCHAR(50) NOT NULL,
   Prenom VARCHAR(50) NOT NULL,
   Email VARCHAR(100) NOT NULL,
   Mot_de_passe VARCHAR(255) NOT NULL,
   Telephone VARCHAR(20) NOT NULL,
   Adresse VARCHAR(150) NOT NULL,
   Code_postal VARCHAR(10) NOT NULL,
   Ville VARCHAR(80) NOT NULL,
   Pays VARCHAR(50) NOT NULL,
   Actif BOOLEAN NOT NULL,
   Reset_token VARCHAR(255),
   Reset_expire DATETIME,
   Role_id INT NOT NULL,
   PRIMARY KEY (Utilisateur_id),
   UNIQUE (Email),
   FOREIGN KEY (Role_id) REFERENCES Role (Role_id)
) ENGINE=InnoDB;

CREATE TABLE Image (
   Image_id INT AUTO_INCREMENT,
   Chemin VARCHAR(255) NOT NULL,
   Texte_alternatif VARCHAR(150) NOT NULL,
   Menu_id INT NOT NULL,
   PRIMARY KEY (Image_id),
   FOREIGN KEY (Menu_id) REFERENCES Menu (Menu_id)
) ENGINE=InnoDB;

CREATE TABLE Commande (
   Commande_id INT AUTO_INCREMENT,
   Numero_commande VARCHAR(30) NOT NULL,
   Date_commande DATE NOT NULL,
   Date_prestation DATE NOT NULL,
   Heure_livraison TIME NOT NULL,
   Adresse_prestation VARCHAR(150) NOT NULL,
   Ville_prestation VARCHAR(80) NOT NULL,
   Distance_km DECIMAL(6,2) NOT NULL,
   Nb_personnes INT NOT NULL,
   Prix_menu DECIMAL(8,2) NOT NULL,
   Prix_livraison DECIMAL(8,2) NOT NULL,
   Remise DECIMAL(8,2) NOT NULL,
   Total DECIMAL(8,2) NOT NULL,
   Pret_materiel BOOLEAN NOT NULL,
   Materiel_restitue BOOLEAN NOT NULL,
   Motif_annulation TEXT,
   Mode_contact VARCHAR(10),
   Menu_id INT NOT NULL,
   Utilisateur_id INT NOT NULL,
   PRIMARY KEY (Commande_id),
   UNIQUE (Numero_commande),
   FOREIGN KEY (Menu_id) REFERENCES Menu (Menu_id),
   FOREIGN KEY (Utilisateur_id) REFERENCES Utilisateur (Utilisateur_id)
) ENGINE=InnoDB;

CREATE TABLE Avis (
   Avis_id INT AUTO_INCREMENT,
   Note INT NOT NULL,
   Commentaire TEXT NOT NULL,
   Statut VARCHAR(20) NOT NULL,
   Commande_id INT NOT NULL,
   PRIMARY KEY (Avis_id),
   UNIQUE (Commande_id),
   FOREIGN KEY (Commande_id) REFERENCES Commande (Commande_id)
) ENGINE=InnoDB;

CREATE TABLE suit (
   Statut_id INT,
   Commande_id INT,
   date_heure DATETIME NOT NULL,
   PRIMARY KEY (Statut_id, Commande_id),
   FOREIGN KEY (Statut_id) REFERENCES Statut (Statut_id),
   FOREIGN KEY (Commande_id) REFERENCES Commande (Commande_id)
) ENGINE=InnoDB;

CREATE TABLE contient (
   Allergene_id INT,
   Plat_id INT,
   PRIMARY KEY (Allergene_id, Plat_id),
   FOREIGN KEY (Allergene_id) REFERENCES Allergene (Allergene_id),
   FOREIGN KEY (Plat_id) REFERENCES Plat (Plat_id)
) ENGINE=InnoDB;

CREATE TABLE propose (
   Plat_id INT,
   Menu_id INT,
   PRIMARY KEY (Plat_id, Menu_id),
   FOREIGN KEY (Plat_id) REFERENCES Plat (Plat_id),
   FOREIGN KEY (Menu_id) REFERENCES Menu (Menu_id)
) ENGINE=InnoDB;
