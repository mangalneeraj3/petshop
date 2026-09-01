<?php
header('Content-Type: application/json');
require 'db.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $stmt = $pdo->query("SELECT * FROM enquiries ORDER BY id DESC");
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($result ?: []);
} 
elseif ($method === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    
    // Check if it's a status update
    if (isset($data['action']) && $data['action'] === 'toggleStatus') {
        $enq_id = $data['id'];
        $new_status = $data['status'];
        $stmt = $pdo->prepare("UPDATE enquiries SET status = ? WHERE enq_id = ?");
        $stmt->execute([$new_status, $enq_id]);
        echo json_encode(["status" => "success"]);
    } else {
        // It's a new enquiry
        $enq_id = 'ENQ-' . rand(1000, 9999);
        $date = date("M j, Y");
        $pet_name = $data['petName'] ?? 'General Enquiry';
        $customer_name = $data['customerName'];
        $phone = $data['phone'];
        $message = $data['message'] ?? '';
        $status = 'New';
        
        $stmt = $pdo->prepare("INSERT INTO enquiries (enq_id, date, petName, customerName, phone, message, status) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$enq_id, $date, $pet_name, $customer_name, $phone, $message, $status]);
        echo json_encode(["status" => "success"]);
    }
}
elseif ($method === 'DELETE') {
    $data = json_decode(file_get_contents('php://input'), true);
    $enq_id = $data['id'];
    $stmt = $pdo->prepare("DELETE FROM enquiries WHERE enq_id = ?");
    $stmt->execute([$enq_id]);
    echo json_encode(["status" => "success"]);
}
?>
