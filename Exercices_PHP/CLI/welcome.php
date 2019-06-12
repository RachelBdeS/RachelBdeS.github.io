<!-- C:\wamp64\www\rbaretto\Exercices_PHP -->

<?php
if (count($argv) > 1)
{
  $arg = $argv[1];
}
else 
{
  echo 'Type your name: ';
  $arg = fgets(STDIN);
}

echo PHP_EOL . "Welcome ".trim($arg). PHP_EOL;

?>