<?php
$dsn="mysql:host=localhost;dbname=project";
$dbusername="root";
$dbpassword="";
try{
    $conn = new PDO($dsn,$dbusername,$dbpassword);
    $conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e){
    die("An error had occured : ".$e->getMessage());
}