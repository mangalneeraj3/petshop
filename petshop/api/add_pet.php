<?php
header('Content-Type: application/json');
require 'db.php';

$data = json_decode(file_get_contents('php://input'), true);

if (!$data) {
    echo json_encode(["status" => "error", "message" => "No data received"]);
    exit;
}

$pet_id = $data['id'] ?? 'PET-' . rand(1000, 9999);
$name = $data['name'];
$category = $data['category'];
$gender = $data['gender'];
$age = $data['age'];
$description = $data['description'] ?? '';
$image = $data['image'] ?? '';

// Check if pet already exists (for Edit mode)
$stmt = $pdo->prepare("SELECT id FROM pets WHERE pet_id = ?");
$stmt->execute([$pet_id]);
$exists = $stmt->fetch();

if ($exists) {
    // Update existing pet
    $sql = "UPDATE pets SET name=?, category=?, gender=?, age=?, description=?";
    $params = [$name, $category, $gender, $age, $description];
    
    // Only update image if a new one was provided
    if (!empty($image)) {
        $sql .= ", image=?";
        $params[] = $image;
    }
    
    $sql .= " WHERE pet_id=?";
    $params[] = $pet_id;
    
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    echo json_encode(["status" => "success", "message" => "Pet updated successfully"]);
} else {
    // Insert new pet
    $stmt = $pdo->prepare("INSERT INTO pets (pet_id, name, category, gender, age, description, image) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$pet_id, $name, $category, $gender, $age, $description, $image]);
    echo json_encode(["status" => "success", "message" => "Pet added successfully"]);
}
?>