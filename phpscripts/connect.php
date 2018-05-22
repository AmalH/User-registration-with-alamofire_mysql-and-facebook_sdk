<?php 

	define('HOST','localhost');
	define('USER','root');
	define('PASS','root');
	define('DB','booklog');
	
	$con = mysqli_connect(HOST,USER,PASS,DB) or die('unable to connect to db');

	?>
