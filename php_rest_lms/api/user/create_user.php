<?php
// Headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

include_once '../../config/Database.php';
include_once '../../models/Users.php';

// Instantiate DB & connect
$database = new Database();
$db = $database->connect();

// Instantiate blog post object
$user = new Users($db);

// Get raw posted data
$data = json_decode(file_get_contents("php://input"));


$user->Student_id = $data->Student_id;
$user->Student_Name = $data->Student_Name;
$user->Password = $data->Password;
$user->Contact_Number = $data->Contact_Number;


// Create post
if ($user->create_user()) {
    echo json_encode(
        array('message' => 'User Added')
    );
} else {
    echo json_encode(
        array('message' => 'User Not Added')
    );
}

