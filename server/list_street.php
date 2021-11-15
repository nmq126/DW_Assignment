<?php
$id = '';
if (isset($_GET['district_id'])) {
    $id = $_GET['district_id'];
}
$keyword ='';
if (isset($_GET['keyword'])){
    $keyword = ($_GET['keyword']);
}
include 'connect.php';
$cnn = connectToServer();

$sql = "SELECT s.name AS street_name, d.name AS district_name, s.status, s.created_at, s.description
        FROM streets AS s
        JOIN districts AS d
        ON s.district_id = d.id ";

if ($id != null && strlen($id > 0) && $keyword != null && strlen($keyword) > 0){
    $sql .= "WHERE s.district_id = $id AND s.name LIKE '%$keyword%'";
}

elseif ($id != null && strlen($id > 0)) {
    $sql .= "WHERE s.district_id = $id";
}

elseif ($keyword != null && strlen($keyword) > 0) {
    $sql .= " WHERE s.name LIKE '%$keyword%'";
}

$result = $cnn->query($sql);

header('Content-Type: application/json; charset=utf-8');

if ($result->num_rows > 0) {
    $rows = array();
    http_response_code(200);
    while ($r = mysqli_fetch_assoc($result)) {
        $rows[] = $r;
    }
    print json_encode($rows);
} else {
    print [];
}
$cnn->close();
?>