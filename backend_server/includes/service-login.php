<?php
/*
 Deals with Creating a session to services neaded by the systhem
 */
session_start();
$host  = $_SERVER['HTTP_HOST'];
$host = "http://".$host;


if($_POST && !$_SESSION['service']) {
	$name = $_POST['name'];
	$type = $_POST['type'];
	$pass = $_POST['pass'];

	if(empty($name) || empty($type) || empty($pass)) {
		echo '{"reply": "Acceses denied 1"}';
	} else {
		if($pass == "keyservice_pass") {
			$_SESSION['service'] = array('name' => $name, 'type' => $type);
			echo '{"reply": "Acceses granted 2"}';
		}
	}
} elseif($_SESSION['service']) {
	echo '{"reply": "Acceses granted 3"}';
} else {
	echo '{"reply": "Please information to use service"}';
}
?>