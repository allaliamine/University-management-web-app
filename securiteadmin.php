<?php

if(!isset($_SESSION['admin'])){
    session_start();
    session_destroy();
    header('location: ../../public/index.php');
}

?>