<?php
if(!isset($_SESSION['admin'])) {
	echo '{
		"access": false,
		"error": "Please Login First"
	}';
} elseif (isset($_SESSION['admin']) && !isset($_POST)) {
	echo '{
		"access": true,
		"reply": "No Request Given"
	}';
} elseif (isset($_SESSION) && isset($_POST)) {
	include 'db_lib.php';

	// Getting data about passagers
	if(isset($_POST['get_info'])) {
		$data = array(
			"access": true,
			"reply": "All Passagers",
			"size": 0,
			"data": []
		);
		if($_POST['get_info']['filter'][0] == 'all') {
			$sql_get = "
				SELECT id, username, phone_number, email, regestered_day, last_active FROM
				passagers";

			$got = mysqli_execute($conn, $sql_get);
			$size = mysqli_num_rows($got);
			if($size > 0) {
				$data['size'] = $size;
				while($row = mysqli_fetch_assoc($got)) {
					$column = [
						$row['id'], $row['username'], $row['phone_number'], $row['email'],
						$row['regestered_day'], $row['last_active'],
					];
					array_push($data['data'], $column);
				}
				echo json_encode($data);
			}
		} else {
			$filter = $_POST['get_info']['filter'];
			if(strcasecmp($filter[0] == 'name') == 0) {
				$sql_get = "
					SELECT id, username, phone_number, email, regestered_day, last_active FROM
					passagers WHERE username = ?";
					// Letf at.........
			}
		}

	// Getting
	} elseif (isset(var)) {

	// Lasts option
	} else {
		echo '{
			"access": true,
			"reply": "No Request Given"
		}';
	}
}
?>