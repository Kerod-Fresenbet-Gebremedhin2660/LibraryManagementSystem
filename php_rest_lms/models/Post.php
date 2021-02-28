<?php 
  class Post {
    // DB stuff
    private $conn;
    private $table = array ('author','book','borrower','category','staff','student');

    // Post Properties
    public $Author_id;
    public $Author_Name;
    public $status;
    public $Publication_year;
    public $Category_id;
    public $ISBN_Code;
    public $Book_Title;
    public $Book_img;
    public $Book_desc;

                     
    
    ///---Related to Borrower---///
    public $Borrower_id;
    public $Book_id;
    public $Borrowed_From;
    public $Borrowed_TO;
    public $Actual_Return_Date;
    public $Issued_by;

    // Constructor with DB
    public function __construct($db) {
      $this->conn = $db;
    }

    // Get Books
    public function read() {
      // Create query
      $query = 'SELECT * FROM '.$this->table[0];
      
      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Execute query
      $stmt->execute();

      return $stmt;
    }
    public function read_books() {
      // Create query
      $query = 'SELECT * FROM '.$this->table[1];
      
      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Execute query
      $stmt->execute();

      return $stmt;
    }

    // Get Single Book
    public function read_single($Book_Title) {
          // Create query
          $query = 'SELECT `ISBN_Code`, `status`, `Book_Title`,`Book_desc`,`Book_img`, `Category_id`, `Publication_year` FROM '.$this->table[1].' WHERE Book_Title = ?';
          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Bind BookTitle
          $stmt->bindParam(1, $this->Book_Title);

          // Execute query
          $stmt->execute();

          $row = $stmt->fetch(PDO::FETCH_ASSOC);

          // Set properties
          $this->ISBN_Code = $row['ISBN_Code'];
          $this->status = $row['status'];
          $this->Book_Title = $row['Book_Title'];
          $this->Book_desc= $row['Book_desc'];
          $this->Book_img= $row['Book_img'];
          $this->Category_id = $row['Category_id'];
          $this->Publication_year = $row['Publication_year'];
          
          return $stmt;
    }
    public function read_single_ISBN($ISBN_Code) {
          // Create query
          $query = 'SELECT `ISBN_Code`, `status`, `Book_Title`,`Book_desc`,`Book_img`, `Category_id`, `Publication_year` FROM '.$this->table[1].' WHERE ISBN_Code = ?';
          // Prepare statement
          $stmt = $this->conn->prepare($query);

          // Bind BookTitle
          $stmt->bindParam(1, $this->ISBN_Code);

          // Execute query
          $stmt->execute();

          $row = $stmt->fetch(PDO::FETCH_ASSOC);

          // Set properties
          $this->ISBN_Code = $row['ISBN_Code'];
          $this->status = $row['status'];
          $this->Book_Title = $row['Book_Title'];
          $this->Book_desc = $row['Book_desc'];
          $this->Book_img = $row['Book_img'];
          $this->Category_id = $row['Category_id'];
          $this->Publication_year = $row['Publication_year'];
          
          return $stmt;
    }
    public function read_single_Author_Name($Author_Name){
        $query = 'SELECT `Author_Name`,`ISBN_Code`, `status`, `Book_Title`, `Category_id`, `Publication_year` FROM '.$this->table[0].' AS auth, '.$this->table[1].' AS book WHERE auth.Author_id=book.Author_id AND `Author_Name`= ?';
        $stmt = $this->conn->prepare($query);

          // Bind BookTitle
          $stmt->bindParam(1, $this->Author_Name);

          // Execute query
          $stmt->execute();

          $row = $stmt->fetch(PDO::FETCH_ASSOC);

          // Set properties
          $this->Author_Name = $row['Author_Name'];
          $this->ISBN_Code = $row['ISBN_Code'];
          $this->status = $row['status'];
          $this->Book_Title = $row['Book_Title'];
          $this->Category_id = $row['Category_id'];
          $this->Publication_year = $row['Publication_year'];
    }
    public function create_author() {
    //    // Create query
          $query = 'INSERT INTO ' . $this->table[0] . ' SET Author_id = :Author_id, Author_Name= :Author_Name';
          
          // Prepare statement
          $stmt = $this->conn->prepare($query);
          

          // Clean data
          $this->Author_id = htmlspecialchars(strip_tags($this->Author_id));
          $this->Author_Name = htmlspecialchars(strip_tags($this->Author_Name));
          
          

          // Bind data
          $stmt->bindParam(':Author_id', $this->Author_id);
          $stmt->bindParam(':Author_Name', $this->Author_Name);
          

          // Execute query
          if($stmt->execute()){
              return true;
          }
          
          
     }
    public function create_book(){
         $query = 'INSERT INTO ' . $this->table[1] . ' SET ISBN_Code= :ISBN_Code, '
                 . 'Book_Title= :Book_Title, '
                 . 'Category_id= :Category_id, '
                 . 'status= :status, '
                 . 'Author_id= :Author_id, '
                 . 'Publication_year= :Publication_year';
          
          // Prepare statement
          $stmt = $this->conn->prepare($query);
          

          // Clean data
          $this->ISBN_Code = htmlspecialchars(strip_tags($this->ISBN_Code));
          $this->Book_Title = htmlspecialchars(strip_tags($this->Book_Title));
          $this->Category_id = htmlspecialchars(strip_tags($this->Category_id));
          $this->status = htmlspecialchars(strip_tags($this->status));
          $this->Author_id = htmlspecialchars(strip_tags($this->Author_id));
          $this->Publication_year = htmlspecialchars(strip_tags($this->Publication_year));
          
          

          // Bind data
          $stmt->bindParam(':ISBN_Code', $this->ISBN_Code);
          $stmt->bindParam(':Book_Title', $this->Book_Title);
          $stmt->bindParam(':Category_id', $this->Category_id);
          $stmt->bindParam(':status', $this->status);
          $stmt->bindParam(':Author_id', $this->Author_id);
          $stmt->bindParam(':Publication_year', $this->Publication_year);
          

          // Execute query
          if($stmt->execute()){
              return true;
          }
          
    }
    public function update_author() {
    //       // Create query
          $query = 'UPDATE ' . $this->table[0] . '
                                 SET Author_Name = :Author_Name WHERE Author_id= :Author_id';

    //       // Prepare statement
          $stmt = $this->conn->prepare($query);

    //       // Clean data
          $this->Author_id = htmlspecialchars(strip_tags($this->Author_id));
          $this->Author_Name = htmlspecialchars(strip_tags($this->Author_Name));
          

    //       // Bind data
           $stmt->bindParam(':Author_id', $this->Author_id);
           $stmt->bindParam(':Author_Name', $this->Author_Name);
           

    //       // Execute query
           if($stmt->execute()) {
             return true;
          }

           // Print error if something goes wrong
          printf("Error: %s.\n", $stmt->error);

           return false;
    }
    public function update_book() {
    //       // Create query
          $query = 'UPDATE ' . $this->table[1] . '
                                 SET ISBN_Code= :ISBN_Code, Book_Title = :Book_Title, Category_id = :Category_id, status = :status, Publication_year= :Publication_year WHERE ISBN_Code= :ISBN_Code';


          $stmt = $this->conn->prepare($query);


          $this->ISBN_Code = htmlspecialchars(strip_tags($this->ISBN_Code));
          $this->Book_Title = htmlspecialchars(strip_tags($this->Book_Title));
          $this->Category_id = htmlspecialchars(strip_tags($this->Category_id));
          $this->status = htmlspecialchars(strip_tags($this->status));
          $this->Publication_year= htmlspecialchars(strip_tags($this->Publication_year));
          


           $stmt->bindParam(':ISBN_Code', $this->ISBN_Code);
           $stmt->bindParam(':Book_Title', $this->Book_Title);
           $stmt->bindParam(':Category_id', $this->Category_id);
           $stmt->bindParam(':status', $this->status);
           $stmt->bindParam(':Publication_year', $this->Publication_year);
           

    //       // Execute query
           if($stmt->execute()) {
             return true;
          }

           // Print error if something goes wrong
          printf("Error: %s.\n", $stmt->error);

           return false;
    }
    public function delete_book(){
    //       // Create query
           $query = 'DELETE FROM ' . $this->table[1] . ' WHERE ISBN_Code = :ISBN_Code';

    //       // Prepare statement
           $stmt = $this->conn->prepare($query);

    //       // Clean data
           $this->ISBN_Code = htmlspecialchars(strip_tags($this->ISBN_Code));

    //       // Bind data
           $stmt->bindParam(':ISBN_Code', $this->ISBN_Code);

    //       // Execute query
          if($stmt->execute()) {
             return true;
          }

    //       // Print error if something goes wrong
           printf("Error: %s.\n", $stmt->error);

          return false;
     }
     public function delete_author(){
         //       // Create query
           $query = 'DELETE FROM ' . $this->table[0] . ' WHERE Author_id = '.$this->Author_id.'';

    //       // Prepare statement
           $stmt = $this->conn->prepare($query);

    //       // Clean data
           $this->Author_id = htmlspecialchars(strip_tags($this->Author_id));

    //       // Bind data
           //$stmt->bindParam(1, $this->Author_id);

    //       // Execute query
          if($stmt->execute()) {
             return true;
          }else{
               printf("Error: %s.\n", $stmt->error);

          return false;
          }

    //       // Print error if something goes wrong
          
     }
    public function read_borrower(){
         $query = 'SELECT * FROM '.$this->table[2];
         $stmt = $this->conn->prepare($query);
         if($stmt->execute()) {
              return $stmt;
          }else{
               printf("Error: %s.\n", $stmt->error);

          return false;
          }
     }
     public function delete_borrower(){
       $query = 'DELETE FROM' .$this->table[2]. ' WHERE Borrower_id = '.$this->Borrower_id.'';
       $stmt = $this->conn->prepare($query);
       $this->Borrower_id = htmlspecialchars(strip_tags($this->Borrower_id));
       if($stmt->execute()) {
              return true;
           }else{
                printf("Error: %s.\n", $stmt->error);
 
           return false;
           }
      }
      public function update_borrower(){
             //       // Create query
          $query = 'UPDATE ' . $this->table[2] . '
          SET Book_id= :Book_id, Borrowed_From = :Borrowed_From, Borrowed_TO = :Borrowed_TO, Actual_Return_Date = :Actual_Return_Date, Issued_by= :Issued_by WHERE Borrower_id= :Borrower_id';
//       // Prepare statement
          $stmt = $this->conn->prepare($query);

//       // Clean data
              $this->Borrower_id = htmlspecialchars(strip_tags($this->Borrower_id));
              $this->Book_id = htmlspecialchars(strip_tags($this->Book_id));
              $this->Borrowed_From = htmlspecialchars(strip_tags($this->Borrowed_From));
              $this->Borrowed_TO = htmlspecialchars(strip_tags($this->Borrowed_TO));
              $this->Actual_Return_Date = htmlspecialchars(strip_tags($this->Actual_Return_Date));
              $this->Issued_by= htmlspecialchars(strip_tags($this->Issued_by));


//       // Bind data
              $stmt->bindParam(':Borrower_id', $this->Borrower_id);
              $stmt->bindParam(':Book_id', $this->Book_id);
              $stmt->bindParam(':Borrowed_From', $this->Borrowed_From);
              $stmt->bindParam(':Borrowed_TO', $this->Borrowed_TO);
              $stmt->bindParam(':Actual_Return_Date', $this->Actual_Return_Date);
              $stmt->bindParam(':Issued_by', $this->Issued_by);


//       // Execute query
              if($stmt->execute()) {
              return true;
              }

// Print error if something goes wrong
              printf("Error: %s.\n", $stmt->error);

              return false;

      }
   public function create_borrower(){
       $query = 'INSERT INTO ' . $this->table[2] . ' SET Borrower_id= :Borrower_id, '
       . 'Book_id= :Book_id, '
       . 'Borrowed_From= :Borrowed_From, '
       . 'Borrowed_TO= :Borrowed_TO, '
       . 'Actual_Return_Date= :Actual_Return_Date, '
       . 'Issued_by= :Issued_by';

       $stmt = $this->conn->prepare($query);
          

       // Clean data
       $this->Borrower_id = htmlspecialchars(strip_tags($this->Borrower_id));
       $this->Book_id = htmlspecialchars(strip_tags($this->Book_id));
       $this->Borrowed_From = htmlspecialchars(strip_tags($this->Borrowed_From));
       $this->Borrowed_TO = htmlspecialchars(strip_tags($this->Borrowed_TO));
       $this->Actual_Return_Date = htmlspecialchars(strip_tags($this->Actual_Return_Date));
       $this->Issued_by = htmlspecialchars(strip_tags($this->Issued_by));
       
       

       // Bind data
       $stmt->bindParam(':Borrower_id', $this->Borrower_id);
       $stmt->bindParam(':Book_id', $this->Book_id);
       $stmt->bindParam(':Borrowed_From', $this->Borrowed_From);
       $stmt->bindParam(':Borrowed_TO', $this->Borrowed_TO);
       $stmt->bindParam(':Actual_Return_Date', $this->Actual_Return_Date);
       $stmt->bindParam(':Issued_by', $this->Issued_by);
       

       // Execute query
       if($stmt->execute()){
           return true;
       }
   }
  }