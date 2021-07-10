<?php
/*
Used to give back information to  services
*/
session_start();

if(!$_SESSION['service']) {
	echo '{"reply":"please login to use service"}';
	exit();
}




?>