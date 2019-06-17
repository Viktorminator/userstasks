<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/core.php';
include_once '../shared/utilities.php';
include_once '../config/database.php';
include_once '../objects/task.php';
include_once '../objects/user.php';
include_once '../libs/JWT.php';

$utilities = new Utilities();

$database = new Database();
$db = $database->getConnection();

$task = new Task($db);
$user = new User($db);

$data = json_decode(file_get_contents("php://input"));

$jwt = isset($data->jwt) ? $data->jwt : "";
$order = isset($data->order) ? $data->order : "";

if ($jwt) {
    try {
        $decoded = JWT::decode($jwt, $key, ['HS256']);
        $user->id = $decoded->data->id;
        $task->order = htmlspecialchars(strip_tags($order));
        $stmt = $task->readPaging($from_record_num, $records_per_page, $user->id, $order);
        $num = $stmt->rowCount();

    } catch (Exception $e) {
        http_response_code(401);
        echo json_encode(array(
            "message" => "Access denied.",
            "error" => $e->getMessage()
        ));
    }
}

if ($num > 0) {

    $tasks_arr = [];
    $tasks_arr["records"] = [];
    $tasks_arr["paging"] = [];

    while ($row = $stmt->fetch()) {
        extract($row);

        $task_item = [
            "id" => $id,
            "email" => $email,
            "description" => html_entity_decode($description),
            "active" => $active,
            "modified" => $modified,
            "created" => $created
        ];

        array_push($tasks_arr["records"], $task_item);
    }

    $total_rows = $task->count();
    $page_url = "{$home_url}task/read_paging.php?";
    $paging = $utilities->getPaging($page, $total_rows, $records_per_page, $page_url);
    $tasks_arr["paging"] = $paging;

    http_response_code(200);
    echo json_encode($tasks_arr);
} else {
    http_response_code(404);
    echo json_encode(
        array("message" => "No tasks found.")
    );
}
