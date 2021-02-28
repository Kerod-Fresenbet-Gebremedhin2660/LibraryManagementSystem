<?php
 // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: POST');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Post.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate book post object
  $post = new Post($db);
  // Get raw posted data
  $data = json_decode(file_get_contents("php://input"));
  $post->ISBN_Code = $data->ISBN_Code;
  $post->status = $data->status;
  $post->Book_Title = $data ->Book_Title;
  $post->Author_id=$data->Author_id;
  $post->Category_id = $data ->Category_id;
  $post->Publication_year = $data ->Publication_year;
  
  echo($post->Author_id);

if($post->create_book()) {
    echo json_encode(
      array('message' => 'Post Created')
    );
  } else {
    echo json_encode(
      array('message' => 'Post Not Created')
    );
  }