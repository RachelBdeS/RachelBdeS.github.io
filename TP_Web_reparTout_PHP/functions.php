<?php

function genererTableau(array $table)
{
    // Déclaration du tableau de résultat du formulaire renseigné
    echo '<table class="tableau">';
    echo '<tr>';
    echo '<th>Clé</th>';
    echo '<th>Valeur</th>';
    echo '</tr>';

    foreach($table as $key => $value)
    {
        echo '<tr>'; // Ouverture d'une ligne de tableau
        echo '<td>'.$key.'</td>'; // Déclaration de la cellule qui contiendra la clé
        echo '<td>'.strip_tags($value).'</td>'; // Déclaration de la cellule qui contiendra la valeur
        echo '</tr>'; // Fermeture de la ligne du tableau
    }
    echo '</table>'; // Fermeture du tableau
}

function connextionBDD($utilisateur, $motdepasse)
{
    try
    {
        // création de la chaîne de connexion
        // on demarre la chaîne par le pilote à utiliser (mysql:, mssql: ...)
        // 3 paramètres à renseigner :
        // host (url du serveur, généralement localhost)
        // port (par défaut, msql = 3306)
        // charset (par déefaut latin1). Pour UTF-8 on ne met pas le tiret.
        $dsn = 'mysql:host=localhost;charset=UTF8;port=3306';

        // Création de l'objet de connexion avec la classe PDO (/!\ en majuscule /!\)
        // 3 paramètres : la chaîne de connexion créer plus haut, le nomdutilisateur et le mot de passe.
        $pdo = new PDO($dsn, $utilisateur, $motdepasse);

        return $pdo;
    }
    catch(Exception $ex)
    {
        
    }
}

?>