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

    $sql = "INSERT INTO `skills` (`id`, `name`) VALUES ('$id', '$name');";

    if (mysqli_query($conn, $sql)) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
} elseif ($method == 'GET') {
    $sql = "SELECT * from skills";
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
    header('Content-Type: application/json');
} else {
    $sql = "SELECT * from skills";
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


// <?php
// header("Access-Control-Allow-Origin: *");
// header('Access-Control-Allow-Headers: Content-Type');

// $servername = "localhost";
// $username = "root";
// $password = "";
// $dbname = "ourproject";
// // Create connection
// $conn = mysqli_connect($servername, $username, $password, $dbname);
// // Check connection
// if (!$conn) {
//     die("Connection failed: " . mysqli_connect_error());
// };

// if ($_SERVER['REQUEST_METHOD'] === 'POST') {
//     $params = (array) json_decode(file_get_contents('php://input'), TRUE);
//     $id = $params["id"];
//     $name = $params["name"];

//     $sql = "INSERT INTO `skills` (`id`, `name`) VALUES ('$id', '$name');";

//     if (mysqli_query($conn, $sql)) {
//         echo "New record created successfully";
//     } else {
//         echo "Error: " . $sql . "<br>" . mysqli_error($conn);
//     }
// } else {
//     $sql = "SELECT * from skills";
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
// };

// mysqli_close($conn);
