<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Methods: GET, POST,DELETE');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ourproject";
// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
};
// Check request method
$method = $_SERVER['REQUEST_METHOD'];
if ($method == 'POST') {
    $params = (array) json_decode(file_get_contents('php://input'), TRUE);
    $id = $params["id"];
    $name = $params["name"];
    $email = $params["email"];
    $password = $params["password"];
    $phone = $params["phone"];
    // $userType = $params["userType"];

    // `userType`
    $sql = "INSERT INTO `users` (`id`, `Name`, `email`, `password`, `phone`) VALUES ('$id', '$name', '$email', '$password', '$phone');";
    // '$userType'

    if (mysqli_query($conn, $sql)) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
} elseif ($method == 'GET') {
    $sql = "SELECT id,name,email,password,phone from users";
    $result = mysqli_query($conn, $sql);
    $arr = array();
    if (mysqli_num_rows($result) > 0) {
        // output data of each row
        while ($row = mysqli_fetch_assoc($result)) {
            array_push($arr, $row);
            // echo "id: " . $row["id"]. " - Name: " . $row["name"]. " " . $row["password"]. "<br>". $row["email"]. "<br>";
        }
    } else {
        echo "0 results";
    }
    header('Content-Type: application/json');
    echo json_encode($arr);
} elseif ($method == 'PUT') {

    $post_vars = (array) json_decode(file_get_contents('php://input'), TRUE);
    echo $post_vars["id"];
    $userid = $post_vars['id'];
    $name = $post_vars['name'];
    $phone = $post_vars['phone'];
    $email = $post_vars['email'];
    $sql = "update `users` set `name`= '$name', `phone`= '$phone',`email`= '$email' where `id`='$userid';";

    if (mysqli_query($conn, $sql)) {

        $returnResponse = (object) [
            "isValid" => true,
            "errorMessage" => ""
        ];
        echo json_encode($returnResponse);
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
    header('Content-Type: application/json');
} elseif ($method == 'DELETE') {


    $userid = $_GET['user_id'];

    $sql = "delete from `users` where `id`='$userid';";

    if (mysqli_query($conn, $sql)) {

        $returnResponse = (object) [
            "isValid" => true,
            "errorMessage" => ""
        ];
        echo json_encode($returnResponse);
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
    header('Content-Type: application/json');
} else {
    echo 'unknown action';
}
mysqli_close($conn);
