<?php
/*
Deals with logins
*/

session_start();

if(isset($_SESSION['id'])) {
	header("Location: index.php");
	exit();
} else {
	$page = 'login';
	require 'views/login_regester.php';
}
?>