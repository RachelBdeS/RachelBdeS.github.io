<?php
/* NB: echo var_export($argv, true); affiche la liste du tableau d'arguments de la dernière ligne de commande (pour DEBUG) */
// NB: CTRL+C = pause d'urgence en CLI 
/* NB: exit($saisie); affiche du contenu et stop le programme de suite après (pour DEBUG) */
// ------------------------------------------------
// Chemin du programme à entrer dans le terminal : 
// "C:\wamp64\www\rbaretto\Exercices_PHP\CLI". 

/* PHP en CLI • SCRIPT MODELE POUR MA FAQ */

// Déclarations publiques
$input;

// Fonctions appelées
function showMenu()
{
  echo "----------------".PHP_EOL;
  echo "CHOOSE A PROGRAM".PHP_EOL;
  echo "----------------".PHP_EOL;
  echo "[1] Display your chosen name".PHP_EOL;
  echo "[2] Calaculate the sum of two chosen numbers".PHP_EOL;
  echo "[3] Calculate age from a chosen date of birth".PHP_EOL;
  echo "[4] Display files of a chosen repertory";
}

function isValidDigit($min, $max)
{
  $isDigit=false;
  $min = floatval($min);
  $max = floatval($max);
  do
  {
    $input = trim(fgets(STDIN));
    if (!is_numeric($input))
    {
      echo "Digits only, please: ";
    }
    else 
    {
      $input = floatval($input);
      if ($input<$min || $input>$max)
      {
        echo "Number beween $min and $max, please: ";
      } 
      else {
        $isDigit=true;
      }
    }
  }
  while (!$isDigit);
  return $input;
}

// Fonction principale 

// Menu (liste des options) en CLI
showMenu();

do 
{
  echo PHP_EOL.PHP_EOL;
  // Récupère la saisie de l'utilisateur
  echo "YOU CHOICE (Menu: M): ";
  $saisie = trim(fgets(STDIN)); /* Il est nécessaire de trimer le retour chariot pour qu'il ne soit pas pris en compte */;

  // Selon la saisie utilisateur,
  switch (strtoupper($saisie))
  {
    case "M": 
      showMenu(); 
      break;
    case "1": 
      echo PHP_EOL;
      echo "---------".PHP_EOL;
      echo "PROGRAM 1".PHP_EOL;
      echo "---------".PHP_EOL;
      // Si un paramètre est saisi a la fin de la ligne de commande d'execution de ce script, 
      if ($argc>1) 
      {
        $surname = $argv[1];
        $name = $argv[2];
      }
      else {
        echo "Type your surname: ";
        $surname = trim(fgets(STDIN));
        echo "Type your family name: ";
        $name = trim(fgets(STDIN));
      }
      echo PHP_EOL;
      echo "Welcome, $surname $name!";
      echo PHP_EOL;
      echo "---------";
      break;
    case "2": 
      echo PHP_EOL;
      echo "---------".PHP_EOL;
      echo "PROGRAM 2".PHP_EOL;
      echo "---------".PHP_EOL;
      echo "Type the first number (1M max): ";
      $nb1 = isValidDigit(0,1000000);
      echo "Type the second number (1M max): ";
      $nb2 = isValidDigit(0,1000000);
      $sum = floatval($nb1+$nb2);
      echo PHP_EOL;
      echo "$nb1+$nb2=$sum";
      echo PHP_EOL;
      echo "---------";
      break;
    case "3": 
      echo PHP_EOL;
      echo "---------".PHP_EOL;
      echo "PROGRAM 3".PHP_EOL;
      echo "---------".PHP_EOL;
      $today = date("Y-m-D H:i:s");
      echo "Type a day of the month for the day of birth: ";
      $d=isValidDigit(1,31);
      echo "Type a month number for the month of birth: ";
      $m=isValidDigit(1,12);
      echo "Type the four digits of the year of birth: ";
      $Y=isValidDigit(1900,2016);
      $birthday = date("$Y-$m-$d 0:0:0");
      $age = intval($today-$birthday); //ooo ?
      echo PHP_EOL;
      echo "This person would be $age today.";
      echo PHP_EOL;
      echo "---------";
      break;
    case "4": 
    echo PHP_EOL;
      echo "---------".PHP_EOL;
      echo "PROGRAM 4".PHP_EOL;
      echo "---------".PHP_EOL;
      echo "Type the path of the repertory: ";
      $rep = trim(fgets(STDIN));
      $iteration  = new DirectoryIterator($rep);
      echo 'Contents of '.$rep.PHP_EOL;
      echo PHP_EOL;
      foreach($iteration as $document)
      {
        echo $document->getFilename().PHP_EOL;
      }
      echo "---------";
      break;
    default: echo "(This choice is not avaliable.)".PHP_EOL;    
    echo PHP_EOL;
  }
}
while ($saisie!="EXIT");
echo PHP_EOL;
echo "---------".PHP_EOL;
echo "GOOD BYE!".PHP_EOL;
echo "---------".PHP_EOL;
?>