<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Post.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog post object
  $post = new Post($db);

  // Get ID
  $post->ISBN_Code = isset($_GET['ISBN_Code']) ? $_GET['ISBN_Code'] : die();

  // Get post
  $post->read_single_ISBN($_GET['ISBN_Code']);

  // Create array
  $post_arr = array(
    'ISBN_Code' => $post->ISBN_Code,
    'status' => $post->status,
    'Author_id' => $post->Author_id,
    'Book_Title' => $post -> Book_Title,
    'Book_desc' => $post->Book_desc,
    'Book_img' => $post->Book_img,
    'Category_id' => $post ->Category_id,
    'Publication_year' => $post->Publication_year,
   );

  // Make JSON
  print_r(json_encode($post_arr));