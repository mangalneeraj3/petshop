<?php
header('Content-Type: application/json');
require 'db.php';

$category = $_GET['category'] ?? null;
$pet_id = $_GET['id'] ?? null;

try {
    if ($pet_id) {
        $stmt = $pdo->prepare("SELECT * FROM pets WHERE pet_id = ?");
        $stmt->execute([$pet_id]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
    } elseif ($category) {
        $stmt = $pdo->prepare("SELECT * FROM pets WHERE category = ? ORDER BY id DESC");
        $stmt->execute([$category]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } else {
        $stmt = $pdo->query("SELECT * FROM pets ORDER BY id DESC");
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    
    echo json_encode($result ?: []);
} catch(PDOException $e) {
    echo json_encode(["status" => "error", "message" => $e->getMessage()]);
}
?>