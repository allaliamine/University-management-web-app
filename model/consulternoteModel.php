<?php
declare(strict_types=1);
require_once '../config/conn.php';

class consulternoteModel {

    function fetch_note($idetudiant){
        global $conn; 
        $query="SELECT * FROM note Where ;";
        $stmt=$conn->prepare($query);
        $stmt->execute();
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

}