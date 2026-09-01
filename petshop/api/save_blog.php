<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");

include_once 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

if (!$data) {
    echo json_encode(array("status" => "error", "message" => "Invalid data."));
    exit;
}

$id = isset($data['id']) ? $data['id'] : null;
$title = $data['title'] ?? '';
$slug = $data['slug'] ?? '';
$content = $data['content'] ?? '';
$image = $data['image'] ?? '';
$author = isset($data['author']) ? $data['author'] : 'Samaria Pet Shop';
$meta_description = $data['meta_description'] ?? '';
$keywords = $data['keywords'] ?? '';

try {
    if ($id) {
        // Update
        $sql = "UPDATE blogs SET title=?, slug=?, content=?, image=?, author=?, meta_description=?, keywords=? WHERE id=?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$title, $slug, $content, $image, $author, $meta_description, $keywords, $id]);
    } else {
        // Insert
        $sql = "INSERT INTO blogs (title, slug, content, image, author, meta_description, keywords) VALUES (?, ?, ?, ?, ?, ?, ?)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$title, $slug, $content, $image, $author, $meta_description, $keywords]);
    }
    echo json_encode(array("status" => "success", "message" => "Blog saved successfully."));
} catch (PDOException $e) {
    echo json_encode(array("status" => "error", "message" => "Failed to save blog: " . $e->getMessage()));
}
?>
