<?php

if(!isset($_SESSION['prof'])){
    session_start();
    session_destroy();
    header('location: ../../public/index.php');
}

?>