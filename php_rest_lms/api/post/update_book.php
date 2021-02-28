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
//$post->ISBN_Code = isset($_GET['ISBN_Code']) ? $_GET['ISBN_Code'] : die();
  $post->ISBN_Code = $_GET['ISBN_Code'];
  $post->Book_Title = $data->Book_Title;
  $post->Author_id = $data ->Author_id;
  $post->Category_id = $data->Category_id;
  $post->status = $data->status;
  $post->Publication_year= $data->Publication_year;
  

  // Update post
  if($post->update_book_put($_GET['ISBN_Code'])){
    echo json_encode(
      array('message' => 'Book Data Updated')
    );
  } else {
    echo json_encode(
      array('message' => 'Book Data Not Updated')
    );
  }

