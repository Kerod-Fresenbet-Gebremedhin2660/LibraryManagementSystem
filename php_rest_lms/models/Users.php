<?php /** @noinspection SqlDialectInspection */

class Users{
    private $table = array ('author','book','borrower','category','staff','student');
     // define properties
    public $Student_id;
    public $Student_Name;
    public $Password;
    public $Contact_Number;

    private $conn;

    public function __construct($db){
        $this->conn = $db;
    }

    public function create_user():bool{
        $user_creation_query = 'INSERT INTO ' . $this->table[5] . ' SET Student_id= :Student_id, '
            . 'Student_Name= :Student_Name, '
            . 'Password= :Password, '
            . 'Contact_Number= :Contact_Number';
        $stmt = $this->conn->prepare($user_creation_query);
        // Clean data
        $this->Student_id = htmlspecialchars(strip_tags($this->Student_id));
        $this->Student_Name = htmlspecialchars(strip_tags($this->Student_Name));
        $this->Password = htmlspecialchars(strip_tags($this->Password));
        $this->Contact_Number = htmlspecialchars(strip_tags($this->Contact_Number));
        //hashing the password
        $hashed_password = hash("sha256", $this->Password);
        // Bind data
        $stmt->bindParam(':Student_id', $this->Student_id);
        $stmt->bindParam(':Student_Name', $this->Student_Name);
        $stmt->bindParam(':Password', $hashed_password);
        $stmt->bindParam(':Contact_Number', $this->Contact_Number);


        if($stmt->execute()){
            return true;
        }

        return false;
    }

//    public function check_email(){
//
//        $email_query = "SELECT * from ".$this->users_tbl." WHERE email = ?";
//
//        $usr_obj = $this->conn->prepare($email_query);
//
//        $usr_obj->bind_param("s", $this->email);
//
//        if($usr_obj->execute()){
//
//            $data = $usr_obj->get_result();
//
//            return $data->fetch_assoc();
//        }
//
//        return array();
//    }
//
//    public function check_login(){
//
//        $email_query = "SELECT * from ".$this->users_tbl." WHERE email = ?";
//
//        $usr_obj = $this->conn->prepare($email_query);
//
//        $usr_obj->bind_param("s", $this->email);
//
//        if($usr_obj->execute()){
//
//            $data = $usr_obj->get_result();
//
//            return $data->fetch_assoc();
//        }
//
//        return array();
//    }



}


