<?php
// NB: CTRL+C = pause d'urgence en CLI
// NB: exit($saisie); /* Pour DEBUG : Affiche du contenu et stop le programme de suite après */
// ------------------------------------------------
// Chemin du programme à entrer dans le terminal : 
// "C:\wamp64\www\rbaretto\Exercices_PHP\CLI". 

echo var_export($argv, true);
// Si le tableau 'arguments count or argc" contient plus d'1 élément, 
if ($argc>1)
{
  // Stock le 2e élément dans la variable arg
  $arg=$argv[1];
}
// Menu (liste des options) en CLI
echo "CHOOSE A PROGRAM";
echo PHP_EOL.PHP_EOL;
echo '[1] Display your chosen name';
echo PHP_EOL.PHP_EOL;
echo "[2] Calaculate the sum of two chosen numbers";
echo PHP_EOL.PHP_EOL;
echo "[3] Calculate age from a chosen date of birth";
echo PHP_EOL.PHP_EOL;
echo "[4] Display files of a chosen repertory";
echo PHP_EOL.PHP_EOL;
do 
{
  // Récupère la saisie de l'utilisateur
  echo "YOU CHOICE: ";
  $saisie = trim(fgets(STDIN)); /* Il est nécessaire de trimer le retour chariot pour qu'il ne soit pas pris en compte */
  
  // Selon la saisie utilisateur,
  switch ($saisie) 
  {
    case "1": echo "PROGRAM 1";
      echo "Type your surname: ";
      $surname = trim(fgets(STDIN));
      echo "Type your family name: ";
      $name = trim(fgets(STDIN));
      echo "Welcome, $surname $name!";
      break;
    case "2": echo "PROGRAM 2";
      echo "Type the first number: ";
      $nb1 = trim(fgets(STDIN));
      echo "Type the second number: ";
      $nb2 = trim(fgets(STDIN));
      $sum = $nb1+$nb2;
      echo "$nb1+$nb2=$sum";
      break;
    case "3": echo "PROGRAM 3";
      echo "Type a day of birth (use two digits): ";
      $DD = trim(fgets(STDIN));
      echo "Type a month of birth (use two digits): ";
      $MM = trim(fgets(STDIN));
      echo "Type a year of birth (use four digits): ";
      $YYYY = trim(fgets(STDIN));
      $age = "$DD/$MM/$YYYY";
      echo "This person is $age.";
      echo "Well, they would be if you played by the rules...";
      break;
    case "4": echo "PROGRAM 4";
    echo "Work in progress. ooo";
      break;
    case "exit": echo "Good bye !";
      break;
    default: echo "(This choice is not avaliable.)";    
    echo "\n\n";
  }
}
while (($saisie!="1") && ($saisie!="2") && ($saisie!="3") && ($saisie!="4") && ($saisie!="exit"));

?>