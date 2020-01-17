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

function connexionBDD($utilisateur, $motdepasse)
{
  try
  {
    // Déclaration d'une commande de connexion à la BDD
    // <pilote à utiliser>: 
    // host=<url du serveur, généralement localhost>;
    // port=<3306 pour mysql>;
    // charset=<latin 1 par défaut, prefere le UTF-8 (a écrire UTF8 ici)> 
    // <dbname>=<ici repartout>
    $dsn = 'mysql:host=localhost;charset=UTF8;port=3306;dbname=repartout';

    $options = [
      PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ];

                               // QUESTION: pourquoi appeler cette variable "dsn" ?
    // Déclaration de l'objet de connexion (c'est une instance de la classe php "PDO")
    // new PDO(<cde de connexion>, <ID du serveur web>, <mdp du serveur web>, <tableau d'options>;
    $pdo = new PDO($dsn, $utilisateur, $motdepasse, $options);

    // Retourne cet objet comme valeur de cette fonction 
    return $pdo;
  }
  catch(Exception $ex)
  {
    
  }
}

?>