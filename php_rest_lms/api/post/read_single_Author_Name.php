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
  $post->Author_Name = isset($_GET['Author_Name']) ? $_GET['Author_Name'] : die();

  // Get post
  $post->read_single_Author_Name($_GET['Author_Name']);

  // Create array
  $post_arr = array(
    'Author_Name' => $post->Author_Name,
    'ISBN_Code' => $post->ISBN_Code,
    'status' => $post->status,
    'Book_Title' => $post -> Book_Title,
    'Category_id' => $post ->Category_id,
    'Publication_year' => $post->Publication_year,
   );

  // Make JSON
  print_r(json_encode($post_arr));