<?php
$servername = "10.69.8.45";
$username = "adel";
$password = "adel";
$dbname = "stage";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
}

// $conn->query('INSERT INTO stagiaire (nom, prenom) VALUES ("X" , "Y")');


$sql = "SELECT id, nom, prenom FROM stagiaire";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
        echo "id: " . $row["id"]. " - Name: " . $row["nom"]. " " . $row["prenom"]. "<br>";
        }
} else {
        echo "0 results";
}
$conn->close();
?>
