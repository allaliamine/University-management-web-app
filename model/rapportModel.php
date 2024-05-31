<?php
declare(strict_types=1);
require_once '../config/conn.php';

class rapportModel {

    function fetch_niveau(){
        
        global $conn; 
        $query="SELECT * FROM Niveau ;";
        $stmt=$conn->prepare($query);
        $stmt->execute();
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    

    function fetch_module($prof){

        global $conn;
        $query="SELECT * FROM Module WHERE IdProf=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$prof['IdProf']]);
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;

    }

    function upload_rapportprof($Descriptive,$idProf,$IdNiveau,$idModule,$Datelimite){
        
        global $conn;
        $query="INSERT INTO Rapport (Descriptive,IdProf,IdNiveau,IdModule,Deadline) VALUES (?,?,?,?,?);";
        $stmt=$conn->prepare($query);
        $stmt->execute([$Descriptive,$idProf,$IdNiveau,$idModule,$Datelimite]);
    }

    function fetch_idrapport($module,$id_prof){
        global $conn;
        $query="SELECT * FROM Rapport WHERE IdProf=? AND IdModule=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$id_prof,$module]);
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }


    function fetch_students($id_rapport){
        global $conn;
        $query = "SELECT r.*, s.*,rp.*
                  FROM Rapportetd r 
                  INNER JOIN Etudiant s ON r.IdEtudiant = s.IdEtudiant
                  INNER JOIN Rapport rp ON rp.IdRapport = r.IdRapport 
                  WHERE r.IdRapport = ?";
        $stmt = $conn->prepare($query);
        $stmt->execute([$id_rapport]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    

}