-- Quelques requêtes
USE mediatheque;
 
-- 1) Afficher les noms et prénoms des acteurs du film "Matrix"
SELECT `acteurs`.`nom`, `acteurs`.`prenom` 
FROM `acteurs`, `films`, `roles`
WHERE `acteurs`.`id_acteur` = `roles`.`id_acteur` 
AND `roles`.`id_film` = `films`.`id_film`
AND `films`.`titre` = 'Matrix';

-- Ou --
SELECT acteurs.nom, acteurs.prenom 
FROM acteurs
JOIN roles ON acteurs.id_acteur = roles.id_acteur
JOIN films ON roles.id_film = films.id_film
WHERE films.titre = 'Matrix';

-- 2) Afficher les noms des réalisateurs et le nombre d`acteurs de chaque film
SELECT films.realisateur, COUNT(acteurs.id_acteur) AS `nbActeurs`
FROM films, roles, acteurs 
WHERE acteurs.id_acteur = roles.id_acteur 
AND roles.id_film = films.id_film
GROUP BY films.id_film;

-- Ou --
SELECT `f`.realisateur, COUNT(`a`.id_acteur) AS `nbActeurs`
FROM films AS `f`
JOIN roles AS `r` ON `f`.id_film = `r`.id_film 
JOIN acteurs AS `a` ON `r`.id_acteur = `a`.id_acteur 
GROUP BY `f`.id_film;

-- 3) Pour "Bienvenue à Gattaca, afficher les noms et prénoms des acteurs, le réalisateur et le titre du film
SELECT `a`.nom, `a`.prenom, `f`.realisateur, `f`.titre 
FROM acteurs AS `a`, films AS `f`, roles AS `r`
WHERE `a`.id_acteur = `r`.id_acteur 
AND `r`.id_film = `f`.id_film
AND `f`.titre = 'Bienvenue à Gattaca';

-- Ou --
SELECT a.nom, a.prenom, f.realisateur, f.titre
FROM acteurs AS a 
JOIN roles AS r ON a.id_acteur = r.id_acteur
JOIN films AS f ON  r.id_film = f.id_film
WHERE f.titre = 'Bienvenue à Gattaca';

-- Afficher tous les acteurs(nom et prenom), les films dans lesquels ils jouent et leur personnage
SELECT a.prenom, a.nom, f.titre, r.personnage 
FROM acteurs AS a, films AS f, roles AS r
WHERE a.id_acteur = r.id_acteur 
AND r.id_film = f.id_film;

-- Ou -- 
SELECT a.prenom, a.nom, f.titre, r.personnage 
FROM acteurs AS a
JOIN roles AS r ON a.id_acteur = r.id_acteur
JOIN films AS f ON r.id_film = f.id_film;

-- A debogger : 
SELECT acteurs.id_acteur, COUNT(roles.personnage),
    CASE 
        WHEN COUNT(roles.personnage) = 2 THEN 
            SELECT acteurs.prenom, acteurs.nom, films.titre, roles.personnage, films.titre, roles.personnage
        ELSE 
            SELECT acteurs.prenom, acteurs.nom, films.titre, roles.personnage
    END
FROM acteurs
JOIN roles ON acteurs.id_acteur = roles.id_acteur 
JOIN films ON roles.id_film = films.id_film
GROUP BY acteurs.id_acteur;