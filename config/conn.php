<?php

$conn = new PDO("mysql:host=localhost;dbname=project", "root", "");

if($conn){
    echo"success";
}
else{
    echo "echouee";
}