<?php
include 'connect.php';
$cnn = connectToServer();

$cnn->query("DROP TABLE IF EXISTS districts");
$cnn->query("DROP TABLE IF EXISTS streets");

$query = '';
$sqlScript = file('street_manager.sql');
foreach ($sqlScript as $line)	{

    $startWith = substr(trim($line), 0 ,2);
    $endWith = substr(trim($line), -1 ,1);

    if (empty($line) || $startWith == '--' || $startWith == '/*' || $startWith == '//') {
        continue;
    }

    $query = $query . $line;
    if ($endWith == ';') {
        mysqli_query($cnn,$query) or die('<div class="error-response sql-import-response">Problem in executing the SQL query <b>' . $query. '</b></div>');
        $query= '';
    }
}
echo '<div class="success-response sql-import-response">SQL file imported successfully</div>';
?>
