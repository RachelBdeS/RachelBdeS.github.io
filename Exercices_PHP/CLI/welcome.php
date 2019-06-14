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

// Fonction appelée
function isValidDigit($maxChars)
{
  $digit=false;
  do
  {
    $input = trim(fgets(STDIN));
    if (!is_numeric ($input))
    {
      echo "(Invalid. Digits only, remember?) Please confirm: ";
    }
    else if (!$maxChars='' && strlen ($input) > $maxChars)
    {
      echo "(Invalid. $maxChars digits max, remember?) Please confirm: ";
    }
    else {
      $digit=true;
    }
  }
  while (!$digit);
  return $input;
}

// Fonction principale 

// Menu (liste des options) en CLI
echo "----------------".PHP_EOL;
echo "CHOOSE A PROGRAM".PHP_EOL;
echo "----------------".PHP_EOL;
echo "[1] Display your chosen name".PHP_EOL;
echo "[2] Calaculate the sum of two chosen numbers".PHP_EOL;
echo "[3] Calculate age from a chosen date of birth".PHP_EOL;
echo "[4] Display files of a chosen repertory";

do 
{
  echo PHP_EOL.PHP_EOL;
  // Récupère la saisie de l'utilisateur
  echo "YOU CHOICE: ";
  $saisie = trim(fgets(STDIN)); /* Il est nécessaire de trimer le retour chariot pour qu'il ne soit pas pris en compte */;

  // Selon la saisie utilisateur,
  switch ($saisie)
  {
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
      echo "Type the first number: ";
      $nb1 = isValidDigit('');
      echo "Type the second number: ";
      $nb2 = isValidDigit('');
      $sum = intval($nb1+$nb2);
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
      echo "Type a day of birth (use one digit if possible): ";
      $d=isValidDigit('2');
      echo "Type a month of birth (use one digit if possible): ";
      $m=isValidDigit('2');
      echo "Type a year of birth (use four digits): ";
      $Y=isValidDigit('4');
      $birthday = date("$Y-$m-$d 0:0:0");
      $age = intval($today-$birthday);
      echo PHP_EOL;
      echo "This person would be $age.";
      echo PHP_EOL;
      echo "---------";
      break;
    case "4": 
    echo PHP_EOL;
      echo "---------".PHP_EOL;
      echo "PROGRAM 4".PHP_EOL;
      echo "---------".PHP_EOL;
      echo "Work in progress. ooo";
      break;
    default: echo "(This choice is not avaliable.)";    
    echo PHP_EOL.PHP_EOL;
  }
}
while ($saisie!="exit");
echo PHP_EOL;
echo "---------".PHP_EOL;
echo "GOOD BYE!".PHP_EOL;
echo "---------".PHP_EOL;
?>