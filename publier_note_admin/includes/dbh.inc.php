<?php
$dsn="mysql:host=localhost;dbname=projetweb";
$dbusername="root";
$dbpassword="";
try{
    $pdo = new PDO($dsn,$dbusername,$dbpassword);
    $pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e){
    die("An error had occured : ".$e->getMessage());
}