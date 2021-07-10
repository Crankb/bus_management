<?php
/*
Main navigation index page
*/
session_start();

// Navigate to the write page according to data gotten
if(!isset($_SESSION['id'])) {
    echo "Not in session...";
    header('Location: login.php');
} else {
    if(isset($_GET['mode'])) {
        if($_GET['mode'] == 'logout') {
            require 'includes/db_lib.php';
            update_active($conn, $_SESSION['id']);
            session_destroy();
            header("Location: login.php");
            exit();
        }
    }
    echo "In session...";
    require 'views/homepage.php';
}
?>