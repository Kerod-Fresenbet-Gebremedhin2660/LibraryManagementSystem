<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: PUT');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Post.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog post object
  $post = new Post($db);

  // Get raw posted data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  $post->Borrower_id= $data->Borrower_id;
  $post->Book_id = $data->Book_id;
  $post->Borrowed_From = $data->Borrowed_From;
  $post->Borrowed_TO = $data->Borrowed_TO;
  $post->Actual_Return_Date = $data->Actual_Return_Date;
  $post->Issued_by= $data->Issued_by;
  
  

  // Update post
  if($post->update_borrower()) {
    echo json_encode(
      array('message' => 'Book Data Updated')
    );
  } else {
    echo json_encode(
      array('message' => 'Book Data Not Updated')
    );
  }

