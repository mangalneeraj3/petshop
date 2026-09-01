<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");

include_once 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['id'])) {
    echo json_encode(array("status" => "error", "message" => "Blog ID required."));
    exit;
}

$id = $data['id'];

try {
    $sql = "DELETE FROM blogs WHERE id = ?";
    $stmt = $pdo->prepare($sql);
    if ($stmt->execute([$id])) {
        echo json_encode(array("status" => "success", "message" => "Blog deleted successfully."));
    } else {
        echo json_encode(array("status" => "error", "message" => "Failed to delete blog."));
    }
} catch (PDOException $e) {
    echo json_encode(array("status" => "error", "message" => "Error: " . $e->getMessage()));
}
?>
