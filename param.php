<?php
$server="localhost";
$user="user";
$pass="user";
$db="gestitrain";

$link = mysqli_connect($server , $user, $pass);
if (!$link) {
   die('Impossible de se connecter : ' . mysqli_error($link));
}

// Rendre la base de données foo, la base courante
$db_selected = mysqli_select_db( $link, $db);
if (!$db_selected) {
   die ('Impossible de sélectionner la base de données : ' . mysqli_error($link));
}
?>
