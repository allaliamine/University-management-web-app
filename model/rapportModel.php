<?php
declare(strict_types=1);
require_once '../config/conn.php';

class rapportModel {

    function fetch_niveau(){
        
        global $conn; 
        $query="SELECT * FROM niveau ;";
        $stmt=$conn->prepare($query);
        $stmt->execute();
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    

    function fetch_module(){

        global $conn;
        $query="SELECT * FROM module WHERE IdProf=?;";
        $stmt=$conn->prepare($query);
        $prof=$_SESSION['prof'];
        $stmt->execute([$prof['IdProf']]);
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;

    }

    function upload_rapportprof($Descriptive,$idProf,$IdNiveau,$idModule,$Datelimite){
        
        global $conn;
        $query="INSERT INTO rapport (Descriptive,IdProf,IdNiveau,IdModule,Deadline) VALUES (?,?,?,?,?);";
        $stmt=$conn->prepare($query);
        $stmt->execute([$Descriptive,$idProf,$IdNiveau,$idModule,$Datelimite]);
    }

}