<?php
    $data = json_decode(file_get_contents('php://input'), true);
    $name = $data['name'];
    $district_id = $data['district_id'];
    $created_at = $data['created_at'];
    $description = $data['description'];
    $status = $data['status'];

    include 'connect.php';
    $cnn = connectToServer();

    $sql = "INSERT INTO streets (name, district_id, created_at, description, status)
            VALUES ('$name','$district_id','$created_at','$description','$status')";

    header('Content-Type: application/json; charset=utf-8');

    if ($cnn->query($sql) === TRUE) {
        $data = new stdClass();
        $data->message = 'Action success';
        http_response_code(201);
        echo json_encode($data);
    } else {
        $data = new stdClass();
        $data->message = 'Action failed';
        http_response_code(500);
        echo json_encode($data);
    }
    $cnn->close();
?>