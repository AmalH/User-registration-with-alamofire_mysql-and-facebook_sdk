<?php

if($_SERVER['REQUEST_METHOD']=='GET') {

   $response = array();
   //mendapatkan data
   $email = $_GET['email'];
   $password = $_GET['password'];
$username = $_GET['username'];
    
    require_once('connect.php');
    
     $sql = "INSERT INTO user (email,password,username) VALUES('$email','$password','$username')";
     if(mysqli_query($con,$sql)) {
       $response["value"] = 1;
       $response["message"] = "succes";
       echo json_encode($response);
     } else {
       $response["value"] = 0;
       $response["message"] = "oops!conexion failed1";
       echo json_encode($response);
     }
    
   mysqli_close($con);
} else {
  $response["value"] = 0;
  $response["message"] = "conexion failed2!";
  echo json_encode($response);
}
?>
