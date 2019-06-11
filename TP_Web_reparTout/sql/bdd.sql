USE repartout;

-- Désactive les contraintes des clés étrangères
SET FOREIGN_KEY_CHECKS=0; /* Désactive le control des relations entre les tables. Permet de modifier des tables sans respecter les critères d'ordre de creation ou de suppression imposés par leurs relations. */

-- -------- --
-- CREATION --
-- -------- --

-- Vide, puis crée la table fournisseurs: 
-- DELETE FROM fournisseurs; /* Pour PHP my ADMIN : empeche l'option "verification des clées étrangères" de la section INSERESION ds=des BDD de PHPmyAdmin d'outrepasser la commande SET GLOBAL FOREIGN_KEY_CHECKS*/
TRUNCATE TABLE fournisseurs; 
INSERT INTO fournisseurs
(
	tel_fournisseur, 
	nom_fournisseur, 
	adresse_fournisseur
) 
VALUES 
('03.89.89.89.87', 'Pneus pour tous ', '11 rue de Mulhouse 68400 Riedisheim'),
('03.88.77.78.70', 'Pneumorama ', '141 avenue de Colmar 68100 Mulhouse');

VALUES 
('Pneus pour tous', '03.89.89.89.87', '11 rue de Mulhouse 68400 Riedisheim'),
('Pneumorama ', '03.88.77.78.70', '141 avenue de Colmar 68100 Mulhouse');

-- Vide, puis crée la table pneus: 
-- DELETE FROM pneus; /* Pour PHP my ADMIN */
TRUNCATE TABLE pneus; 
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

-- Rétablit les contraintes des clés étrangères
SET FOREIGN_KEY_CHECKS=1;