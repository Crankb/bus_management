<?php
/*
This files handles login and creation of sessions for admins
*/
session_start();
$host  = $_SERVER['HTTP_HOST'];
$host = "http://".$host;
if(isset($_POST) && !isset($_SESSION['admin'])) {
	// Check if details are given through POST
	if(isset($_POST['username']) && isset($_POST['password'])) {
		$username = $_POST['username'];
		$password = $_POST['password'];

		require 'db_lib.php';
		$sql = "SELECT * FROM admins WHERE username = ?";
		$statement = mysqli_stmt_init($conn);

		if(!mysqli_stmt_prepare($statement, $sql)) {
			echo '{
				"access": false,
				"error": "Could Not Load sql"
			}';
			exit();

		} else {
			mysqli_stmt_bind_param($statement, "s", $username);
			mysqli_stmt_execute($statement);
			$results = mysqli_stmt_get_result($statement);

			if($row = mysqli_fetch_assoc($results)) {
				$pass_check = password_verify($password, $row['password']);
				if($pass_check == true) {
					$_SESSION['admin'] = $row['id'];
					echo '{
						"access": true,
						"reply": "Logged in",
						"error": null
					}';
					exit();
				} elseif($pass_check == false) {
					echo '{
						"access": false,
						"error": "Wrong Password"
					}';
					exit();
				}

			} else {
				echo '{
					"access": false,
					"error": "Username Not Found"
				}';
				exit();

			}
		}
	}

// Check the is session is already given
} elseif(isset($_POST['mode']) && isset($_SESSION['admin'])) {
	if($_POST['mode'] == 'log_out') {
		session_destroy();
		echo '{
			"access": true,
			"reply": "Logged Out",
			"error": null
		}';
		exit();

	} else {
		echo '{
			"access": false,
			"reply": null,
			"error": "Invalid Mode request Given"
		}';
		exit();
	}

// Checks if in session
} elseif(isset($_SESSION['admin'])) {
	echo '{
		"access": true,
		"reply": "In Session",
		"error": null
	}';
	exit();

// If no info is provided
} elseif(isset($_POST)) {
	echo '{
		"access": false,
		"error": "Please Provide Valid Details"
	}';
	exit();

// If the method is invalid
} else {
	echo '{
		"access": false,
		"error": "Invalid Method"
	}';
	exit();

}


?>