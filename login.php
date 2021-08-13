<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type');
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ourproject";
// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $params = (array) json_decode(file_get_contents('php://input'), TRUE);
    $username = $params["UserName"];
    $password = $params["Password"];
    $sql = "select * from users where name='$username' and password='$password'";
    $result = mysqli_query($conn, $sql);
    if ($result) {
        if (mysqli_num_rows($result) == 1) {
            $row = mysqli_fetch_assoc($result);
            $returnResponse = (object) [
                "isValid" => true,
                "errorMessage" => "",
                "userID"=>$row['id']
            ];
        } else {
            $returnResponse = (object) [
                "isValid" => false,
                "errorMessage" => "Invalid username or password"
            ];
        }
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
}
echo json_encode($returnResponse);
