<?php

if($_SERVER['REQUEST_METHOD']=='GET') {

   $response = array();
   //mendapatkan data
   $email = $_GET['email'];
   $password = $_GET['password'];

   require_once('connect.php');
  
    $sql1 = "SELECT * FROM user WHERE email ='$email'";
    $checkemail = mysqli_fetch_array(mysqli_query($con,$sql1));
    
    $sql2 = "SELECT * FROM user WHERE password ='$password'";
    $checkpassword = mysqli_fetch_array(mysqli_query($con,$sql2));
    
   if(isset($checkemail)){
     $response["value"] = 0;
     $response["message"] = "correct email";
     echo json_encode($response);
   }else {
       $response["value"] = 0;
       $response["message"] = "oops! this email is not registered";
       echo json_encode($response);
     }
    
    if(isset($checkpassword)){
        $response["value"] = 0;
        $response["message"] = "correct passs";
        echo json_encode($response);
    }else {
        $response["value"] = 0;
        $response["message"] = "oops! wrong password";
        echo json_encode($response);
    }
    
   mysqli_close($con);
} else {
  $response["value"] = 0;
  $response["message"] = "conexion failed2!";
  echo json_encode($response);
}
?>
