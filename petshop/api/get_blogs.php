<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");

include_once 'db.php';

$id = isset($_GET['id']) ? $_GET['id'] : null;
$slug = isset($_GET['slug']) ? $_GET['slug'] : null;

try {
    if ($id) {
        $sql = "SELECT * FROM blogs WHERE id = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$id]);
        $blog = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($blog) {
            echo json_encode($blog);
        } else {
            http_response_code(404);
            echo json_encode(array("message" => "Blog not found."));
        }
    } elseif ($slug) {
        $sql = "SELECT * FROM blogs WHERE slug = ?";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([$slug]);
        $blog = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($blog) {
            echo json_encode($blog);
        } else {
            http_response_code(404);
            echo json_encode(array("message" => "Blog not found."));
        }
    } else {
        $sql = "SELECT * FROM blogs ORDER BY created_at DESC";
        $stmt = $pdo->query($sql);
        $blogs = $stmt->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($blogs);
    }
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(array("message" => "Error: " . $e->getMessage()));
}
?>
