<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Post.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();
  
  $post = new Post($db);
  
  $result = $post->read_books();
  
  $num = $result->rowCount();

  
  if($num > 0) {
    // Post array
    $posts_arr = array();
    // $posts_arr['data'] = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

      $post_item = array(
        'ISBN_Code' => $ISBN_Code,
        'Book_Title' => $Book_Title,
        'Book_desc' => $Book_desc,
        'Book_img' => $Book_img,
        'Category_id' => $Category_id,
        'status' => $status,
        'Author_id' => $Author_id,
        'Publication_year' => $Publication_year
      );

      // Push to "data"
      array_push($posts_arr, $post_item);
      // array_push($posts_arr['data'], $post_item);
    }

    // Turn to JSON & output
    echo json_encode($posts_arr);

  } else {
    // No Posts
    echo json_encode(
      array('message' => 'No Posts Found')
    );
  }
