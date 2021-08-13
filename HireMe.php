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

    $upload_dir = 'uploads/';
    $server_url = 'http://127.0.0.1:8000';

    $avatar_name = $_FILES["imageFile"]["name"];
    $avatar_tmp_name = $_FILES["imageFile"]["tmp_name"];
    $error = $_FILES["imageFile"]["error"];


    $random_name = rand(1000, 1000000) . "-" . $avatar_name;
    $upload_name = $upload_dir . strtolower($random_name);
    $upload_name = preg_replace('/\s+/', '-', $upload_name);

    if (move_uploaded_file($avatar_tmp_name, $upload_name)) {

        $serviceProviderUserId = $_POST['serviceProviderUserId'];
        $email = $_POST['email'];
        $kindOfDisability = $_POST['kindOfDisability'];
        $skill = $_POST['skill'];
        $userID = $_POST['userID'];

        $sql = "INSERT INTO `hire_me` (`id`, `email`,`skills`, `kind_of_disability`, `imagePath`,`userID`) VALUES (NULL, '$email', '$skill', '$kindOfDisability', '$upload_name','$userID');";
        // '$userType'

        if (mysqli_query($conn, $sql)) {
            echo "New record created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
    }



    // echo isset($_POST['kindOfDisability']);
    // echo isset($_FILES['imageFile']);
    // echo $_FILES["imageFile"]["name"];

} elseif ($method == 'GET') {
    $sql = "SELECT * from hire_me";
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
} else {
    echo 'unknown action';
}
mysqli_close($conn);
