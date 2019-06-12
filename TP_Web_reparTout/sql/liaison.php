<h1>Bonjour</h1>

<?php

$saisie = "toi";
echo '<h3>Salut, '.$saisie.' !</h3>'; // Est interprété plus rapidement.
echo "<h3>Salut, $saisie !</h3>"; // Est plus sécurité.

// Si: http://localhost/<chemin>.php?nom=Dupont&age=53
$nom = $_GET['nom'];
$age = intval($_GET['age']);

echo "Bienvenue, $nom. Vous avez $age ans. ";

/* 
$servername = "localhost";
$username = "repartout";
$password = "Cdi1234";
$dbname = "repartout";
// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
$sql = "ooo";
$result = $conn->query($sql);
if ($result->num_rows>0) {
  while($row = $result->fetch_assoc()) {
    echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
  }
}
mysqli_close($conn);
*/
?>