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
    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
    // Check if image file is a actual image or fake image
    if (isset($_POST["submit"])) {
        $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
        if ($check !== false) {
            echo "File is an image - " . $check["mime"] . ".";
            $uploadOk = 1;
        } else {
            echo "File is not an image.";
            $uploadOk = 0;
        }
    }
    // Check if file already exists
    if (file_exists($target_file)) {
        echo "Sorry, file already exists.";
        $uploadOk = 0;
    }
    // Check file size
    if ($_FILES["fileToUpload"]["size"] > 500000) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
    }
    // Allow certain file formats
    if (
        $imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
        && $imageFileType != "gif"
    ) {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }
    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
        // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
            echo "The file " . basename($_FILES["fileToUpload"]["name"]) . " has been uploaded.";
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }

    $params = (array) json_decode(file_get_contents('php://input'), TRUE);
    $id = $params["id"];
    $user_id = $params["user_id"];
    $job_id = $params["job_id "];
    $kind_of_disability = $params["kind_of_disability"];
    $serviceProvider_Skills  = $params["serviceProvider_Skills   "];

    $sql = "INSERT INTO `disabilities` (`id `, `user_id`, 'job_id', 'kind_of_disability', 'serviceProvider_Skills') VALUES ('$id ', '$user_id', '$job_id', '$kind_of_disability', '$serviceProvider_Skills');";

    if (mysqli_query($conn, $sql)) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
} elseif ($method == 'GET') {
    $sql = "SELECT * from disabilities";
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
    echo 'unknown action';
}
mysqli_close($conn);
