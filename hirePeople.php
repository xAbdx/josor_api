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

        $jobSkill = $_POST['jobType'];
        $jobDescription = $_POST['jobDescription'];
        $jobWage = $_POST['jobWage'];
        $jobTitle = $_POST['jobTitle'];
        $jobProviderUserID = $_POST['userID'];

        $sql = "INSERT INTO `jobs` (`Job_ID`, `Job_Title`, `Job_description`, `Skill_ID`, `price`,`userID`) VALUES (NULL, '$jobTitle', '$jobDescription', '$jobSkill', '$jobWage','$jobProviderUserID');";
      

        if (mysqli_query($conn, $sql)) {
            echo "New record created successfully";
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
    

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
