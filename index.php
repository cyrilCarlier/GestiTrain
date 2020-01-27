<?php
include "param.php";
// C'est la meilleur façon d'exécuter une requête SQL
// Pour plus d'exemples, voir mysql_real_escape_string()
$query = "select ID_train as  tid , gd.nom_gare  as  ngd , ga.nom_gare as nga, Heure_départ, Heure_arrivée  
          from train t, gare gd, gare ga
          where t.ID_gare_départ=gd.ID_gare and t.ID_gare_arrivée=ga.ID_gare";
// Exécution de la requête
$result = mysqli_query($link, $query);
// Vérification du résultat
// Ceci montre la requête envoyée à MySQL ainsi que l'erreur. Utile pour déboguer.
if (!$result) {
    $message  = 'Requête invalide : ' . mysqli_error($link) . "\n";
    $message .= 'Requête complète : ' . $query;
    die($message);
}
// Utilisation du résultat
// Tenter d'affichager $result ne vous donnera pas d'informations contenues dans la ressource
// Une des fonctions MySQL de résultat doit être utilisée
// Voir aussi mysql_result(), mysql_fetch_array(), mysql_fetch_row(), etc.
echo "
<style>
table,
td {
    border: 1px solid #333;
}
thead,
tfoot {
    background-color: #333;
    color: #fff;
}
</style>";
echo "<table>
    <thead>
        <tr>
            <th colspan=\"5\">The table header</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td> id train </id>
            <td>depart </td>
            <td>arrivee</td>
            <td>ville depart </td>
            <td>ville arrivee</td>
        </tr>";
while ($row = mysqli_fetch_assoc($result)) {
    echo "<tr>";
    echo "<td>".$row['tid']."</td>";
    echo "<td>".$row['Heure_départ']."</td>";
    echo "<td>".$row['Heure_arrivée']."</td>";
    echo "<td>".$row['ngd']."</td>";
    echo "<td>".$row['nga']."</td>";
    echo "</tr>";
}
echo "</tbody>
</table>";
// Libération des ressources associées au jeu de résultats
// Ceci est effectué automatiquement à la fin du script
mysqli_free_result($link, $result);
?>
