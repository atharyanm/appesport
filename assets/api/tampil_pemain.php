<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = mysqli_connect('localhost', 'root', '', 'esport');

$kueri = "SELECT * FROM pemain";
$hasil = mysqli_query($conn, $kueri);

$pemain = [];
while ($row = mysqli_fetch_assoc($hasil)) {
    $pemain[] = $row;
}

echo json_encode($pemain);
?>
