<?php
$host  = $_SERVER['HTTP_HOST'];
$host = "http://".$host;

if(!isset($_POST['submit'])) {
	header("Location: $host/index.php");
	exit();
} else {
	$email = trim($_POST['email']);
	$password = trim($_POST['password']);

	$inf = "&email=".$email;

	if(empty($email) || empty($password)) {
		header("Location: $host/login.php?empty=EmptyFields$inf");
		exit();
	} elseif(strlen($password) < 6) {
		header("Location: $host/login.php?pass_error_=Password must be 6 characters and above$inf");
		exit();
	} elseif(strlen($password) > 8) {
		header("Location: $host/login.php?pass_error_=Maximum password length is 8$inf");
		exit();
	} else {
		require 'db_lib.php';
		$sql = "SELECT * FROM passagers WHERE email = ?";
		$statement = mysqli_stmt_init($conn);
		if(!mysqli_stmt_prepare($statement, $sql)) {
			header("Location: $host/login.php?sql_error_=Could not load sql$inf");
			exit();
		} else {
			mysqli_stmt_bind_param($statement, "s", $email);
			mysqli_stmt_execute($statement);
			$results = mysqli_stmt_get_result($statement);

			if($row = mysqli_fetch_assoc($results)) {
				$pass_check = password_verify($password, $row['password']);
				if($pass_check == true) {
					session_start();
					$_SESSION['id'] = $row['id'];
					header("Location: $host/index.php");
					exit();
				} elseif($pass_check == false) {
					header("Location: $host/login.php?pass_error_=Wrong password$inf");
					exit();
				}
			} else {
				header("Location: $host/login.php?email_error_=Email not found$inf");
				exit();
			}
		}
	}
}
?>