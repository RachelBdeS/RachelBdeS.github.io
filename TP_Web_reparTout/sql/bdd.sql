DROP DATABASE IF EXISTS repartout;
CREATE DATABASE repartout CHARACTER SET utf8 COLLATE utf8_general_ci;

USE repartout;

-- Désactive les contraintes des clés étrangères
SET FOREIGN_KEY_CHECKS=0; /* Désactive le control des relations entre les tables. Permet de modifier des tables sans respecter les critères d'ordre de creation ou de suppression imposés par leurs relations. */

-- -------- --
-- CREATION --
-- -------- --

CREATE TABLE IF NOT EXISTS `fournisseurs` 
(
  `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fournisseur` varchar(50) NOT NULL,
  `tel_fournisseur` char(15) NOT NULL,
  `adresse_fournisseur` varchar(255) NOT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `pneus` 
(
  `nom_pneu` varchar(40) NOT NULL,
  `marque_pneu` varchar(50) NOT NULL,
  `diametre_pneu` tinyint(3) UNSIGNED NOT NULL,
  `structure_pneu` varchar(20) NOT NULL,
  `largeur_pneu` int(11) NOT NULL,
  `usage_pneu` varchar(20) NOT NULL,
  `indice_charge_pneu` int(11) NOT NULL,
  `indice_vitesse_pneu` int(11) NOT NULL,
  `prix_achat_ht` decimal(7,2) NOT NULL,
  `prix_vente_ht` decimal(7,2) NOT NULL,
  `id_fournisseur` int(11) NOT NULL,
  PRIMARY KEY (`nom_pneu`),
  KEY `pneus_ibfk_1` (`id_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `commandes`
(
	id_commande INT(11) AUTO_INCREMENT PRIMARY KEY,
    date_commande DATETIME NOT NULL,
    etat_commande VARCHAR(50) NOT NULL,
    prix_total DECIMAL(15,2) NOT NULL,
    paiement_valide INT(11) NOT NULL
    
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE lignes_commande
(
	id_ligne_commande INT(11) AUTO_INCREMENT PRIMARY KEY,
    quantite INT(11) UNSIGNED NOT NULL DEFAULT '0',
    prix_unitaire DECIMAL(7,2) NOT NULL,
	nom_pneu varchar(40) NOT NULL,
	id_commande INT(11) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE lignes_commande
ADD FOREIGN KEY(nom_pneu) REFERENCES pneus(nom_pneu),
ADD FOREIGN KEY(id_commande) REFERENCES commandes(id_commande);

-- ------------- --
-- RENSEIGNEMENT --
-- ------------- --

-- DELETE FROM fournisseurs; /* Pour PHP my ADMIN : empeche l'option "verification des clées étrangères" de la section INSERESION ds=des BDD de PHPmyAdmin d'outrepasser la commande SET GLOBAL FOREIGN_KEY_CHECKS*/
TRUNCATE TABLE fournisseurs; 
-- DELETE FROM fournisseurs; /* Pour PHP my ADMIN */
INSERT INTO fournisseurs
(
	tel_fournisseur, 
	nom_fournisseur, 
	adresse_fournisseur
) 
VALUES 
('03.89.89.89.87', 'Pneus pour tous ', '11 rue de Mulhouse 68400 Riedisheim'),
('03.88.77.78.70', 'Pneumorama ', '141 avenue de Colmar 68100 Mulhouse');

TRUNCATE TABLE pneus;
-- DELETE FROM pneus; /* Pour PHP my ADMIN */
INSERT INTO pneus 
(
	nom_pneu, 
	marque_pneu, 
	diametre_pneu, 
	structure_pneu, 
	largeur_pneu, 
	usage_pneu, 
	indice_charge_pneu, 
	indice_vitesse_pneu, 
	prix_achat_ht, 
	prix_vente_ht, 
	id_fournisseur
)
VALUES 
('MC25', 'Michelin', '13', 'radial', '175', 'Hiver', '3500', '180', '19', '49','1'),
('MC28', 'Michelin', '15', 'radial', '185', '4 saisons', '3500', '180', '29', '95','1'),
('GY21', 'Good Year', '17', 'radial', '195', '4 saisons', '3500', '240', '39', '109','1'),
('GY29', 'Good Year', '19', 'radial', '205', '4 saisons', '3500', '240', '49', '129','1');

TRUNCATE TABLE commandes;
-- DELETE FROM commandes; /* Pour PHP my ADMIN */
INSERT INTO commandes
(
	id_commande, 
	date_commande, 
	etat_commande, 
	prix_total, 
	paiement_valide
)
VALUES 
(1, '2019-02-01', 'livré', 0, 1),
(2, '2019-06-02 15:30:27', 'livraison en cours', 0, 1),
(3, '2019-06-05 07:42:10', 'en cours', 0, 0);

TRUNCATE TABLE lignes_commande;
-- DELETE FROM lignes_commande; /* Pour PHP my ADMIN */
INSERT INTO lignes_commande
(
	id_ligne_commande,
	quantite,
	prix_unitaire,
	nom_pneu,
	id_commande
)
VALUES 
(1, 1, 49, 'MC25', 1),
(2, 1, 95, 'MC28', 1),
(3, 2, 109, 'GY21', 2),
(4, 1, 49, 'MC25', 2),
(5, 1, 95, 'MC28', 2),
(6, 1, 49, 'MC25', 3),
(7, 1, 95, 'MC28', 3),
(8, 1, 109, 'GY21', 3),
(9, 2, 129, 'GY29', 3);

-- Vide, puis crée la table pneus: 
-- DELETE FROM pneus; /* Pour PHP my ADMIN */

-- -------------------- --
-- CALCUL DU PRIX TOTAL --
-- -------------------- --

UPDATE commandes AS c SET 
prixtotal=(
SELECT SUM(prix_unitaire) 
FROM lignes_commande lc
WHERE c.id_commande=lc.id_commandes
) 

-- Ou --
UPDATE commandes AS c SET 
c.prix_total=coalesce(
	(
		SELECT SUM(lc.prix_unitaire * lc.quantite) 
        FROM lignes_commande lc
		WHERE lc.id_commande = c.id_commande
		GROUP BY id_commande
	),
  '0'
);

-- UPDATE commandes SET prixtotal=(SELECT SUM(prix_unitaire) FROM lignes_commande 
-- WHERE commandes.id_commande=lignes_commandes.id_commandes) 

-- --------------------------

-- Rétablit les contraintes des clés étrangères
SET FOREIGN_KEY_CHECKS=1;