<?php

if(!isset($_SESSION['etd'])){
    session_start();
    session_destroy();
    header('location: ../../public/index.php');
}

?>