<?php
    include 'connect.php';
    $cnn = connectToServer();

    $sql = "SELECT * FROM districts";
    $result = $cnn->query($sql);

    header('Content-Type: application/json; charset=utf-8');

    if ($result->num_rows > 0) {
        $rows = array();
        http_response_code(200);
        while($r = mysqli_fetch_assoc($result)) {
            $rows[] = $r;
        }
        print json_encode($rows);
    } else {
    }
    $cnn->close();
?>