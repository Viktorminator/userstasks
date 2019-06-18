<?php
/**
 * Created by PhpStorm.
 * User: host
 * Date: 2019-06-14
 * Time: 19:30
 */
include_once '../config/database.php';
include_once '../objects/task.php';


$database = new database();
$db = $database->getConnection();

$task = new Task($db);

$stmt = $task->read();
$num = $stmt->rowCount();

if ($num > 0) {

    $tasks_arr = array();
    $tasks_arr["records"] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);

        $task_item = [
            "id" => $id,
            "email" => $email,
            "title" => $title,
            "description" => html_entity_decode($description),
            "active" => $active,
            "due_date" => $due_date,
            "priority" => $priority,
            "modified" => $modified,
            "created" => $created
        ];

        array_push($tasks_arr["records"], $task_item);
    }

    http_response_code(200);
    echo json_encode($tasks_arr);
} else {
    http_response_code(404);

    echo json_encode(
        array("message" => "No tasks found.")
    );
}
