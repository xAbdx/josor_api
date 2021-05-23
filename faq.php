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
    $question = $params["question"];
    $answer = $params["answer"];

    $sql = "INSERT INTO `faq` (`id`, `question` , `answer`, `AddDate`) VALUES ('$id', '$question' , '$answer' , now());";

    if (mysqli_query($conn, $sql)) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
} elseif ($method == 'GET') {
    $sql = "SELECT * from faq";
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
    // Method is PUT ///////////////////////////////////////////////////////////////////update
} elseif ($method == 'DELETE') {

    $faq_id = (int) $_GET['faq_id'];

    $sql = "delete from `faq` where `id`='$faq_id';";

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
    $sql = "SELECT * from faq";
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
}
mysqli_close($conn);
