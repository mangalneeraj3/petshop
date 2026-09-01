<?php
header('Content-Type: application/json');
require 'db.php';

$data = json_decode(file_get_contents('php://input'), true);
$username = $data['username'] ?? 'admin'; // Default to admin if not provided
$new_password = $data['new_password'] ?? $data['password'] ?? ''; // Support both names for flexibility

if(empty($new_password)) {
    echo json_encode(["status" => "error", "message" => "Please provide a new password"]);
    exit;
}

try {
    // Check if username exists
    $stmt = $pdo->prepare("SELECT id FROM admins WHERE username = ?");
    $stmt->execute([$username]);
    $admin = $stmt->fetch();

    if($admin) {
        // Update password
        $newHash = password_hash($new_password, PASSWORD_DEFAULT);
        $updateStmt = $pdo->prepare("UPDATE admins SET password_hash = ? WHERE username = ?");
        $updateStmt->execute([$newHash, $username]);
        
        echo json_encode(["status" => "success", "message" => "Password updated successfully"]);
    } else {
        // If 'admin' doesn't exist yet (setup failed), create it
        if ($username === 'admin') {
            $newHash = password_hash($new_password, PASSWORD_DEFAULT);
            $insertStmt = $pdo->prepare("INSERT INTO admins (username, password_hash) VALUES (?, ?)");
            $insertStmt->execute(['admin', $newHash]);
            echo json_encode(["status" => "success", "message" => "Admin account created and password set"]);
        } else {
            echo json_encode(["status" => "error", "message" => "Username not found"]);
        }
    }
} catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Database Error: " . $e->getMessage()]);
}
?>
