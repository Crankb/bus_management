<?php
session_start();
$host  = $_SERVER['HTTP_HOST'];
$host = "http://".$host;

if(!isset($_POST['submit'])) {
	echo "Hear..";
	header("Location: $host/index.php");
	exit();
} else {
	$username = trim($_POST['username']);
	$phone_number = trim($_POST['phone_number']);
	$email = trim($_POST['email']);
	$password = trim($_POST['password']);
	$re_password = trim($_POST['re_password']);

	$inf = "&username=".$username."&phone_number=".$phone_number."&email=".$email;

	if(empty($username) || empty($phone_number) || empty($email) || empty($password) || empty($re_password)) {
		header("Location: $host/regester.php?empty=EmptyFields$inf");
		exit();
	} elseif(!preg_match('/^[-a-zA-Z0-9 ]+$/', $username)) {
		header("Location: $host/regester.php?username_error=Invalid+username$inf");
		exit();
	} elseif(strlen($username) < 4) {
		header("Location: $host/regester.php?username_error=Username%20must%20be%20above%204%20characters$inf");
		exit();
	} elseif(!preg_match('/^[0-9 +]+$/', $phone_number)) {
		header("Location: $host/regester.php?phonenumber_error=Invalid phone number$inf");
		exit();
	} elseif(strlen($username) > 100) {
		header("Location: $host/regester.php?username_error=Username%20big$inf");
		exit();
	} elseif(strlen($password) < 6) {
		header("Location: $host/regester.php?pass_error=Password%20must%20be%206%20characters%20and%20above$inf");
		exit();
	} elseif(strlen($password) > 8) {
		header("Location: $host/regester.php?pass_error=Maximum%20password%20length%20is%208$inf");
		exit();
	} elseif ($password !== $re_password) {
		header("Location: $host/regester.php?re_pass_error=Password%20do%20not%20match$inf");
		exit();
	} else {
		
		# Check if user is in database using secure link

		require 'db_lib.php';
		$sql = "SELECT * FROM passagers WHERE email = ?";
		$statement = mysqli_stmt_init($conn);
		if(!mysqli_stmt_prepare($statement, $sql)) {
			header("Location: $host/regester.php?sql_error=Could%20not%20load%20sql$inf");
			exit();
		} else {
			mysqli_stmt_bind_param($statement, "s", $email);
			mysqli_stmt_execute($statement);
			mysqli_stmt_store_result($statement);
			$rowCount = mysqli_stmt_num_rows($statement);

			if($rowCount > 0) {
				header("Location: $host/regester.php?email_error=Email%20taken$inf");
				exit();
			} else {

				# Adding the Passger using secure link

				$passwordHash = password_hash($password, PASSWORD_DEFAULT);
				$regestered_date = date("Y-m-d H:i:s");
				$sql = "INSERT INTO passagers(username, password, phone_number, email, regestered_date, last_active)
				VALUES (?, ?, ?, ?, ?, ?)";
				$statement2 = mysqli_stmt_init($conn);
				if(!mysqli_stmt_prepare($statement2, $sql)) {
					header("Location: $host/regester.php?sql_error=Could%20not%20load%20sql$inf");
					exit();
				} else {
					mysqli_stmt_bind_param($statement2, "ssssss", $username, $passwordHash, $phone_number, $email, $regestered_date, $regestered_date);
					mysqli_stmt_execute($statement2);

					# Geting and Checking Passager id for session

					$id = is_passager($conn, $email, $passwordHash);
					if($id) {
						$_SESSION['id'] = $id;
						header("Location: $host/index.php");
						exit();
					} else {
						echo var_dump($statement2->error_list);
						# header("Location: $host/regester.php?sql_error=Did%20not%20submit%20information$inf;errors=$errors");
						exit();
					}
				}
			}
		}
	}

}


?>