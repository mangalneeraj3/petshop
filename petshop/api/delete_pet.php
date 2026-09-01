<?php
header('Content-Type: application/json');
require 'db.php';

$data = json_decode(file_get_contents('php://input'), true);
$pet_id = $data['id'] ?? '';

if (empty($pet_id)) {
    echo json_encode(["status" => "error", "message" => "No Pet ID provided"]);
    exit;
}

try {
    $stmt = $pdo->prepare("DELETE FROM pets WHERE pet_id = ?");
    $stmt->execute([$pet_id]);
    echo json_encode(["status" => "success", "message" => "Pet deleted successfully"]);
} catch(PDOException $e) {
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}
?>