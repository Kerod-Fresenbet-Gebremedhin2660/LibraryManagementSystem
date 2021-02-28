<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: DELETE');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Post.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog post object
  $post = new Post($db);

  

  // Set ID to update
  $post->ISBN_Code = $data->ISBN_Code;

  // Delete post
  if($post->delete_book()) {
    echo json_encode(
      array('message' => 'Book Deleted')
    );
  } else {
    echo json_encode(
      array('message' => 'Book Not Deleted')
    );
  }

