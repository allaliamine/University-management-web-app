<?php
declare(strict_types=1);
require_once '../config/conn.php';


class noteModel{

    function fetch_filier(){
    
        global $conn;
        $query="SELECT * FROM Filiere;";
        $stmt=$conn->prepare($query);
        $stmt->execute();
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    
    function fetch_niveau(){
        
        global $conn; 
        $query="SELECT * FROM Niveau ;";
        $stmt=$conn->prepare($query);
        $stmt->execute();
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    
    function fetch_module(){
        
        global $conn;
        $query="SELECT * FROM Module ;";
        $stmt=$conn->prepare($query);
        $stmt->execute();
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    
    function id_niveau(string $nom){
        
        global $conn;
        $query="SELECT * FROM Niveau WHERE Nom=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$nom]);
        $result=$stmt->fetch(PDO::FETCH_ASSOC);
        $id=$result['IdNiveau'];
        return $id;
    }
    
    
    function upload_note(float $Valeur, int $idModule, int $idAdmin, int $idEtudiant){
        
        global $conn;
        $query="INSERT INTO Note (Valeur,idModule,idAdmin,idEtudiant) VALUES (?,?,?,?);";
        $stmt=$conn->prepare($query);
        $stmt->execute([$Valeur,$idModule,$idAdmin,$idEtudiant]);
    }
    
    function get_id_etd(string $CNE){
         
        global $conn;
        $query="SELECT * FROM Etudiant WHERE CNE=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$CNE]);
        $result=$stmt->fetch(PDO::FETCH_ASSOC);
        $id=$result['IdEtudiant'];
        return $id;
    }
    
    function get_id_module(string $module){
         
        global $conn;
        $query="SELECT * FROM Module WHERE Intitule=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$module]);
        $result=$stmt->fetch(PDO::FETCH_ASSOC);
        $id=$result['IdModule'];
        return $id;
    }

    function check_cne_exist(string $CNE){
        global $conn;
        $query="SELECT * FROM Etudiant WHERE CNE=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$CNE]);
        $result=$stmt->fetch(PDO::FETCH_ASSOC);
        return $result ? $result :null;
    }
    
}



