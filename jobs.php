<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Methods: GET, POST');
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
// Check request method
$method = $_SERVER['REQUEST_METHOD'];
if ($method == 'POST') {
    $params = (array) json_decode(file_get_contents('php://input'), TRUE);
    $Job_ID = $params["Job_ID"];
    $Job_Title = $params["Job_Title"];
    $Job_description = $params["Job_description"];
    $Skill_ID = $params["Skill_ID"];
    $price = $params["price"];

    $sql = "INSERT INTO `jobs` (`Job_ID`, `Job_Title`, `Job_description`, `Skill_ID`, `price`) VALUES ('$Job_ID', '$Job_Title', '$Job_description', '$Skill_ID', '$price');";
    if (mysqli_query($conn, $sql)) {
        $returnResponse = (object) [
            "isValid" => true,
            "errorMessage" => ""
        ];
        echo json_encode($returnResponse);
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        $returnResponse = (object) [
            "isValid" => false,
            "errorMessage" => "error happend"
        ];
    }
    header('Content-Type: application/json');
} elseif ($method == 'GET') {
    if (isset($_GET['skill_id'])) {
        $skill_id = $_GET['skill_id'];
        //echo $skill_id;
    } else {
        // Fallback behaviour goes here
    }
    $sql = "select job_id as id ,
            Job_Title as  title,
            Job_description as description,
            price as price,
            '01/01/2021' as date 
            from jobs where skill_id ='$skill_id'";
    //where skill_id ='$skill_id' if you want to show all jobs delete this line
    $result = mysqli_query($conn, $sql);
    $arr = array();
    if (mysqli_num_rows($result) > 0) {
        // output data of each row
        while ($row = mysqli_fetch_assoc($result)) {
            array_push($arr, $row);
            // echo "id: " . $row["id"]. " - Name: " . $row["name"]. " " . $row["password"]. "<br>". $row["email"]. "<br>";
        }
    } else {
        json_encode($result);
    }
    header('Content-Type: application/json');
    echo json_encode($arr);
} else {
    echo 'unknown action';
}
mysqli_close($conn);



// header("Access-Control-Allow-Origin: *");
// // $servername = "localhost:3308";
// $servername = "localhost";
// $username = "root";
// $password = "";
// $dbname = "ourproject";
// // Create connection
// $conn = mysqli_connect($servername, $username, $password, $dbname);
// // Check connection
// if (!$conn) {
//     die("Connection failed: " . mysqli_connect_error());
// }
// if ($_SERVER['REQUEST_METHOD'] === 'POST') {
//     $params = (array) json_decode(file_get_contents('php://input'), TRUE);

//     $id = $params["id"];
//     $title = $params["title"];
//     $description = $params["description"];
//     $typeOfService = $params["typeOfService"];
//     $price = $params["price"];

//     $sql = "INSERT INTO `jobs` (`id`, `title`, `description`, `typeOfService`, `price`) VALUES ('$id', '$title', '$description', '$typeOfService', '$price');";

//     if (mysqli_query($conn, $sql)) {
//         echo "New record created successfully";
//     } else {
//         echo "Error: " . $sql . "<br>" . mysqli_error($conn);
//     }
// } else {
//     $sql = "SELECT * from jobs";
//     $result = mysqli_query($conn, $sql);
//     $arr = array();
//     if (mysqli_num_rows($result) > 0) {
//         // output data of each row
//         while ($row = mysqli_fetch_assoc($result)) {
//             array_push($arr, $row);
//             // echo "id: " . $row["id"]. " - Name: " . $row["name"]. " " . $row["password"]. "<br>". $row["email"]. "<br>";
//         }
//     } else {
//         echo "0 results";
//     }
//     header('Content-Type: application/json');
//     echo json_encode($arr);
// }
// mysqli_close($conn);




// header("Access-Control-Allow-Origin: *");
// $servername = "localhost:3308";
// $username = "root";
// $password = "root";
// $dbname = "ourproject";
// // Create connection
// $conn = mysqli_connect($servername, $username, $password, $dbname);
// // Check connection
// if (!$conn) {
//     die("Connection failed: " . mysqli_connect_error());
// }
// $sql = "SELECT * from jobs";
// $result = mysqli_query($conn, $sql);
// $arr = array();
// if (mysqli_num_rows($result) > 0) {
//     // output data of each row
//     while ($row = mysqli_fetch_assoc($result)) {
//         array_push($arr, $row);
//         // echo "id: " . $row["id"]. " - Name: " . $row["name"]. " " . $row["password"]. "<br>". $row["email"]. "<br>";
//     }
// } else {
//     echo "0 results";
// }
// header('Content-Type: application/json');
// echo json_encode($arr);
// mysqli_close($conn);