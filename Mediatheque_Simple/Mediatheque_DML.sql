-- Création de la BDD MEDIATHEQUE

DROP DATABASE IF EXISTS mediatheque;
CREATE DATABASE mediatheque CHARACTER SET utf8 COLLATE utf8_general_ci;

USE mediatheque;
SET FOREIGN_KEY_CHECKS=0;

-- Creation des table FILMS, ACTEURS, ROLE:

-- -------------------------------
-- Base de données :  mediatheque
-- -------------------------------
-- Structure de la table films --

DROP TABLE IF EXISTS films;
CREATE TABLE films (
  id_film int(11) NOT NULL AUTO_INCREMENT,
  titre varchar(255) NOT NULL,
  realisateur varchar(255) NOT NULL,
  PRIMARY KEY (id_film)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS acteurs;
CREATE TABLE acteurs (
  id_acteur INT not null AUTO_INCREMENT, 
  prenom VARCHAR (255) not null, 
  nom VARCHAR (255) not null, 
  PRIMARY KEY (id_acteur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
  id_acteur INT not null, 
  personnage VARCHAR (255),
  id_film INT not null, 
  PRIMARY KEY (id_acteur, id_film)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE roles 
ADD FOREIGN KEY (id_acteur) REFERENCES acteurs(id_acteur),
ADD FOREIGN KEY (id_film) REFERENCES films(id_film);

-- Ajout des données du jeu de test --

INSERT INTO films (id_film, titre, realisateur) VALUES 
  (1, 'Bienvenue à Gattaca ', 'Andrew Niccol'),
  (2, 'Matrix', 'Les soeurs Wachowski'),
  (3, 'Idiocracy', 'Mike Judge'),
  (4, 'Constantine', 'Francis Lawrence');

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

-- Jeu d'essai --

SELECT films.id_film AS'Film', ':' AS '', films.titre AS '', 'de' AS '', films.realisateur AS 'Réalistateur', roles.personnage AS 'Rôle', 'interprété par' AS '', acteurs.prenom AS 'Acteur', acteurs.nom AS '', '(n°' AS '', acteurs.id_acteur AS '', ')' AS ''
FROM films, acteurs, roles 
WHERE acteurs.id_acteur = roles.id_acteur AND films.id_film = roles.id_film;

-- Ajout de films --

INSERT INTO films (titre, realisateur) VALUES ('Ready Player One', 'Steven Spielberg');
INSERT INTO acteurs (prenom, nom) VALUES ('Tye', 'Sheridan');
INSERT INTO roles VALUES (7, 'Wade Owen Watts', 5);
INSERT INTO acteurs (prenom, nom) VALUES ('Olivia', 'Cooke');
INSERT INTO roles VALUES (8, 'Samantha Evelyn Cook', 5);

INSERT INTO films (titre, realisateur) VALUES ('Tron', 'Steven Lisberger');
INSERT INTO acteurs (prenom, nom) VALUES ('Bruce', 'Boxleitner');
INSERT INTO roles VALUES (9, 'Alan Bradley', 6);
INSERT INTO acteurs (prenom, nom) VALUES ('David', 'Warner');
INSERT INTO roles VALUES (10, 'Maître Contrôle Principal', 6);

INSERT INTO films (titre, realisateur) VALUES ('Autómata', 'Gabe Ibáñez');
INSERT INTO acteurs (prenom, nom) VALUES ('Antonio', 'Banderas');
INSERT INTO roles VALUES (11, 'Jacq Vaucan', 7);
INSERT INTO acteurs (prenom, nom) VALUES ('Dylan', 'McDermott');
INSERT INTO roles VALUES (12, 'Sean Wallace', 7);

SET FOREIGN_KEY_CHECKS=1;