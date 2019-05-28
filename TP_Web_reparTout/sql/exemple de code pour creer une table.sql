-- Base de données :  repartout

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- Creation d'une table (ici "fournisseurs") (en ecrasement):

DROP TABLE IF EXISTS fournisseurs;

CREATE TABLE IF NOT EXISTS fournisseurs (
  id_fournisseur int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant du fournisseur (généré automatiquement)',
  nom_fournisseur varchar(40) NOT NULL COMMENT 'Nom de famille du fournisseur',
  tel_fournisseur char(15) NOT NULL COMMENT 'Numéro de téléphone du fournisseur (format international, longueur fixe)',
  adresse_fournisseur varchar(255) NOT NULL COMMENT 'Adresse postale du fournisseur',
  PRIMARY KEY (id_fournisseur)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
-- {COMMIT};

-- Renseignement de la table :

INSERT INTO fournisseurs (id_fournisseur, nom_fournisseur, tel_fournisseur, adresse_fournisseur) 
VALUES
(3, 'Juste quelques pneus', '03.89.89.89.87', '11 rue de Mulhouse 68400 Riedisheim');
-- {COMMIT};

-- Modification d'une valeur de la table :

UPDATE fournisseurs
SET nom_fournisseur='Pneus pour tous' --, <champs>='<nouvelle valeur>'
WHERE id_fournisseur=3 -- OR <condirion> AND <condition>
-- {COMMIT};

-- Modification d'un champs de la table :

ALTER TABLE fournisseurs
ADD logo_fournisseur VARCHAR(255)
-- {COMMIT};

-- Lecture de la table : 

SELECT nom_fournisseur, SUM(Entrees)
FROM fournisseurs
WHERE id_fournisseur >= 2
GROUP BY Annee_Film
HAVING SUM(Entrees) < 5
ORDER BY 2 ASC
-- {COMMIT};