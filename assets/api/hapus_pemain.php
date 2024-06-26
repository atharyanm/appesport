<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = mysqli_connect('localhost', 'root', '', 'esport');

$id = $_POST['id'] ?? null;

if ($id) {
    $kueri = "DELETE FROM pemain WHERE id = '$id'";
    $hasil = mysqli_query($conn, $kueri);

    if ($hasil) {
        echo json_encode(['message' => 'Data deleted successfully']);
    } else {
        echo json_encode(['message' => 'Failed to delete data']);
    }
} else {
    echo json_encode(['message' => 'Invalid input data']);
}
?>
