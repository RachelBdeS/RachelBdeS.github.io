-- Creation de la base de données mediatheque

-- Suppression si elle existe
DROP DATABASE IF EXISTS mediatheque;
CREATE DATABASE mediatheque CHARACTER SET utf8 COLLATE utf8_general_ci;

 -- Selection de la base de données

 USE mediatheque;

-- Creation des table FILMS, ACTEURS, ROLE:

CREATE TABLE films (
  id_film INT not null AUTO_INCREMENT, 
  titre VARCHAR (255) not null,
  realisateur VARCHAR (255) not null, 
  PRIMARY KEY (id_film)
) ENGINE=InnoDB;

CREATE TABLE acteurs (
  id_acteur INT not null AUTO_INCREMENT, 
  nom VARCHAR (255) not null, 
  prenom VARCHAR (255) not null, 
  PRIMARY KEY (id_acteur)
) ENGINE=InnoDB;

CREATE TABLE roles (
  id_acteur INT not null, 
  id_film INT not null, 
  personnage VARCHAR (255)
) ENGINE=InnoDB;

ALTER TABLE roles 
ADD PRIMARY KEY (id_acteur, id_film),
ADD FOREIGN KEY (id_acteur) REFERENCES acteurs(id_acteur),
ADD FOREIGN KEY (id_film) REFERENCES films(id_film);

-- Ajout des données du jeu de test

INSERT INTO films (id_film, titre, realisateur) VALUES 
  (1, 'Bienvenue à Gattaca ','Andrew Niccol'),
  (2, 'Matrix','Les soeurs Wachowski'),
  (3, 'Idiocracy','Mike Judge'),
  (4, 'Constantine','Francis Lawrence');

INSERT INTO acteurs (id_acteur, nom, prenom) VALUES 
  (1, 'Wilson','Luke'),
  (2, 'Reeves','Keanu'),
  (3, 'Fishburne','Laurence'),
  (4, 'Moss','Carrie-Anne'),
  (5, 'Hawke','Ethan'),
  (6, 'Thurman','Uma');

INSERT INTO roles (id_acteur, id_film, personnage) VALUES 
  ('1','3','Joe Bowers (Pas Sur)'),
  ('2','2','Néo'),
  ('2','4','John Constantine'),
  ('3','2','Morpheus'),
  ('4','2','Trinity'),
  ('5','1','Vincent Anton Freeman'),
  ('6','1','Irene Cassini');

-- 

SELECT * 
FROM films,acteurs,roles 
WHERE acteurs.id_acteur = roles.id_acteur 
AND films.id_film = roles.id_film