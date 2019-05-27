INSERT INTO fournisseurs (
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
  prix_achat_ht_pneu, 
  prix_vente_ht_pneu, 
  #id_fournisseur
)
VALUES 
(
  'RX25', 
  'michelin', 
  '15', 
  'radical', 
  '185', 
  '4 saisons', 
  '3500', 
  '240', 
  '19', 
  '99',
  '1' 
);
