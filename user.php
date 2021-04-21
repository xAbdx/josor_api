<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type');

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

    $id = $params["id"];
    $serviceProviderUserId = $params["serviceProviderUserId"];
    $skill = $params["skill"];
    $location = $params["location"];
    $kindOfDisability = $params["kindOfDisability"];
    $active = $params["active"];
    $adminNote = $params["adminNote"];

    $sql = "INSERT INTO `user` (`id`, `serviceProviderUserId`, `skill`, 'location', 'kindOfDisability', `active`, `adminNote`) VALUES ('$id', '$serviceProviderUserId', '$skill', '$location', '$kindOfDisability', '$active', '$adminNote');";
    if (mysqli_query($conn, $sql)) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
} else {
    $sql = "SELECT * from user";
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
