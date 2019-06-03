USE repartout;

SET FOREIGN_KEY_CHECKS=0;
/* Désactive le control des relations entre les tables. Permet de modifier des tables sans respecter les critères d'ordre de creation ou de suppression imposés par leurs relations. */

-- Vide, puis crée la table fournisseurs: 
DELETE FROM fournisseurs; /* Pour PHP my ADMIN : empeche l'option "verification des clées étrangères" de la section INSERESION ds=des BDD de PHPmyAdmin d'outrepasser la commande SET GLOBAL FOREIGN_KEY_CHECKS*/
TRUNCATE TABLE fournisseurs; 
INSERT INTO fournisseurs
(
  nom_fournisseur, 
  tel_fournisseur, 
  adresse_fournisseur
) 
VALUES 
('Pneus pour tous', '03.89.89.89.87', '11 rue de Mulhouse 68400 Riedisheim'),
('03.88.77.78.70', 'Pneumorama ', '141 avenue de Colmar 68100 Mulhouse');

-- Vide, puis crée la table pneus: 
DELETE FROM fournisseurs; /* Pour PHP my ADMIN */
TRUNCATE TABLE fournisseurs; 
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

DELETE FROM pneus; /* Pour PHP my ADMIN */
TRUNCATE TABLE pneus;

UPDATE pneus 
SET 
nom_pneu='BX45', prix_vente_ht='175.54' 
WHERE 
nom_pneu = 'RX25';

UPDATE pneus 
SET 
diametre_pneu='16', prix_vente_ht='175.54' 
WHERE 
nom_pneu LIKE '%8';

UPDATE pneus 
SET 
diametre_pneu='16', prix_vente_ht='175.54' 
WHERE 
diametre_pneu IN('15', '16', '17');

/*
=  -- égalité
> -- supérieur à
< -- inférieur à
<= -- inférieur ou égal
>= -- supérieur ou égal
<> -- différent de
*/

SET FOREIGN_KEY_CHECKS=1;