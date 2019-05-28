INSERT INTO fournisseurs 
(
  nom_fournisseur, 
  tel_fournisseur, 
  adresse_fournisseur
) 
VALUES (
  'Pneus pour tous', 
  '03.89.89.89.87', 
  '11 rue de Mulhouse 68400 Riedisheim'
);

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
('RX25', 'michelin', '15', 'radial', '185', '4 saisons', '3500', '240', '19', '99','1'),
('RX28', 'michelin', '15', 'radial', '185', '4 saisons', '3500', '240', '19', '99','1'),
('RX21', 'michelin', '15', 'radial', '185', '4 saisons', '3500', '240', '19', '99','1'),
('RX29', 'michelin', '15', 'radial', '185', '4 saisons', '3500', '240', '19', '99','1');

UPDATE pneus 
SET 
diametre_pneu='16', 
prix_vente_ht='175.54' 
WHERE 
nom_pneu LIKE '%8'
;

UPDATE pneus 
SET 
diametre_pneu='16', 
prix_vente_ht='175.54'
WHERE 
diametre_pneu IN('15', '16', '17')
;
