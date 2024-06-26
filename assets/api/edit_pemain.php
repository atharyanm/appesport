<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = mysqli_connect('localhost', 'root', '', 'esport');

$id = $_POST['id'] ?? null;
$nama = $_POST['nama'] ?? null;
$negara = $_POST['negara'] ?? null;
$tim = $_POST['tim'] ?? null;

if ($id && $nama && $negara && $tim) {
    $kueri = "UPDATE pemain SET nama = '$nama', negara = '$negara', tim = '$tim' WHERE id = '$id'";
    $hasil = mysqli_query($conn, $kueri);

    if ($hasil) {
        echo json_encode(['message' => 'Data updated successfully']);
    } else {
        echo json_encode(['message' => 'Failed to update data']);
    }
} else {
    echo json_encode(['message' => 'Invalid input data']);
}
?>
