<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Post.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate post object
  $post = new Post($db);

  // Get ID
  $post->Book_Title = isset($_GET['Book_Title']) ? $_GET['Book_Title'] : die();

  // Get post
  $post->read_single($_GET['Book_Title']);

  // Create array
  $post_arr = array(
    'ISBN_Code' => $post->ISBN_Code,
    'status' => $post->status,
    'Book_Title' => $post -> Book_Title,
    'Book_desc' => $post->Book_desc,
    'Book_img' => $post->Book_img,
    'Category_id' => $post ->Category_id,
    'Publication_year' => $post->Publication_year,
   );

  // Make JSON
  print_r(json_encode($post_arr));