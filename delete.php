<?php
header('Access-Control-Allow-Origin: *');
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

if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $params = (array) json_decode(file_get_contents('php://input'), TRUE);
    $id = $params["categoryid"];

    $sql = "SELECT * from JOBS WHERE skill_id='$id'";
    $result = mysqli_query($conn, $sql);
    $arr = array();
    if (mysqli_num_rows($result) > 0) {
        // output data of each row
        while ($row = mysqli_fetch_assoc($result)) {
            array_push($arr, "the skills is been used by other job  :" . $row["Job_Title"]);
            // array_push($arr, $row);

        }
        $returnResponse = (object) [
            "isValid" => false,
            "errorMessage" => $arr
        ];
        echo json_encode($returnResponse);
    } else {

        $sql = "delete from `skills` where `id`='$id';";

        if (mysqli_query($conn, $sql)) {

            $returnResponse = (object) [
                "isValid" => true,
                "errorMessage" => ""
            ];
            echo json_encode($returnResponse);
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
    }
}
header('Content-Type: application/json');
mysqli_close($conn);
