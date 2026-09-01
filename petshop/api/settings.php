<?php
header('Content-Type: application/json');
require 'db.php';

$data = json_decode(file_get_contents('php://input'), true);
$current_password = $data['current_password'] ?? '';
$new_password = $data['new_password'] ?? '';
$username = 'admin'; // Hardcoded for single admin flow.

if(empty($current_password) || empty($new_password)) {
    echo json_encode(["status" => "error", "message" => "All fields are required"]);
    exit;
}

if(strlen($new_password) < 8) {
    echo json_encode(["status" => "error", "message" => "New password must be at least 8 characters"]);
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM admins WHERE username = ?");
$stmt->execute([$username]);
$admin = $stmt->fetch();

if($admin && password_verify($current_password, $admin['password_hash'])) {
    $new_hash = password_hash($new_password, PASSWORD_DEFAULT);
    $update_stmt = $pdo->prepare("UPDATE admins SET password_hash = ? WHERE username = ?");
    $update_stmt->execute([$new_hash, $username]);
    echo json_encode(["status" => "success", "message" => "Password updated successfully!"]);
} else {
    echo json_encode(["status" => "error", "message" => "Incorrect current password"]);
}
?>
