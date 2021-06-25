<?php
/*
Deals with regestrations
*/

session_start();

if(isset($_SESSION['id'])) {
	header("Location: index.php");
	exit();
} else {
	$page = 'regester';
	require 'views/login_regester.php';
}
?>