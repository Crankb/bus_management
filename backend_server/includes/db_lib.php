<?php
/*
db_lib holds functions to connected direct to the database
*/

// Get a connection to the database
function get_conn() {
	$host = 'localhost';
	$username = 'root';
	$password = 'datasafe';
	$db_name = 'bus_management';

	$conn = mysqli_connect($host, $username, $password, $db_name);
	if(!$conn) {
		return array(NULL, mysqli_error($conn));
	}
	return array($conn, NULL);
}
# Initializing conn
$conn = get_conn()[0];

//Checks if passger email is taken
function is_email_taken($conn, $email) {
	$sql_check = "SELECT * FROM passagers WHERE email = '$email'";
	$data_get = mysqli_query($conn, $sql_check);
	if(mysqli_num_rows($data_get) > 0) {
		return true;
	}
	return false;
}

// Checks if passger is in database
function is_passager($conn, $email, $password) {
	$sql_check = "
		SELECT * FROM passagers WHERE email = '$email' AND password = '$password' LIMIT 1;";
	$data_get = mysqli_query($conn, $sql_check);
	if(mysqli_num_rows($data_get) > 0) {
		$row = mysqli_fetch_assoc($data_get);
		return $row['id'];
	}
}

// Get passager information
function get_passager_info($conn, $id) {
	$sql_get = "SELECT * FROM passagers WHERE id = '$id' LIMIT 1;";
	$data_get = mysqli_query($conn, $sql_get);
	if(mysqli_num_rows($data_get) > 0) {
		$row = mysqli_fetch_assoc($data_get);
		return $row;
	}
}

// Update the last active column of an id
function update_active($conn, $id) {
	$time = date("Y-m-d H:i:s");
	$sql_update = "UPDATE passagers SET last_active = '$time' WHERE id = '$id';";
	mysqli_query($conn, $sql_update);
}

?>