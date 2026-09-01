<?php
header('Content-Type: application/json');
require 'db.php';

$method = $_SERVER['REQUEST_METHOD'];

$pdo->exec("CREATE TABLE IF NOT EXISTS newsletter_subscribers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    subscribed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)");

if ($method === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    $email = $data['email'] ?? '';
    
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        try {
            $stmt = $pdo->prepare("INSERT INTO newsletter_subscribers (email) VALUES (?)");
            $stmt->execute([$email]);
            echo json_encode(["status" => "success", "message" => "Subscribed successfully"]);
        } catch (PDOException $e) {
            // 23000 is the SQLSTATE error code for unique constraint violation
            if ($e->getCode() == 23000) {
                echo json_encode(["status" => "error", "message" => "This email is already subscribed!"]);
            } else {
                echo json_encode(["status" => "error", "message" => "Database error."]);
            }
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Please enter a valid email address."]);
    }
} elseif ($method === 'GET') {
    $stmt = $pdo->query("SELECT * FROM newsletter_subscribers ORDER BY subscribed_at DESC");
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result ?: []);
}
?>
