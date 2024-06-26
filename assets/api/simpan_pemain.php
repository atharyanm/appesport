<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = mysqli_connect('localhost', 'root', '', 'esport');

$nama = $_POST['nama'] ?? null;
$negara = $_POST['negara'] ?? null;
$tim = $_POST['tim'] ?? null;

if ($nama && $negara && $tim) {
    $kueri = "INSERT INTO pemain (nama, negara, tim) VALUES ('$nama', '$negara', '$tim')";
    $hasil = mysqli_query($conn, $kueri);

    if ($hasil) {
        echo json_encode(['message' => 'Data saved successfully']);
    } else {
        echo json_encode(['message' => 'Failed to save data']);
    }
} else {
    echo json_encode(['message' => 'Invalid input data']);
}
?>
