<?php
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

$sql = "INSERT INTO clients (nom_client, prenom_client, adresse_client, tel_client) VALUES ("& nom &", "& prenom &", "& adresse &", "& tel &")";


if (mysqli_query($conn, $sql)) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . mysqli_error($conn);
}

mysqli_close($conn);
?>