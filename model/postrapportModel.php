<?php
declare(strict_types=1);
require_once '../config/conn.php';

class postrapportModel {

    function fetch_rapport(){
        global $conn; 
        $currentDate = date("Y-m-d");
        $niveauetd = $_SESSION['etd'];
        $query = "SELECT r.*, p.Nom, m.Intitule 
                  FROM Rapport r 
                  JOIN Prof p ON r.IdProf = p.IdProf
                  JOIN Module m ON r.IdModule = m.IdModule 
                  WHERE r.IdNiveau = ? AND r.Deadline >= ?";
        $stmt = $conn->prepare($query);
        $stmt->execute([$niveauetd['IdNiveau'], $currentDate]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    
    

    function fetch_nommodule(int $id){

        global $conn;
        $query="SELECT * FROM Module WHERE IdModule=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$id]);
        $result=$stmt->fetch(PDO::FETCH_ASSOC);
        $nom=$result['Intitule'];
        return $nom;
    }


    function fetch_nomprofesseur(int $id){

        global $conn;
        $query="SELECT * FROM Prof WHERE IdProf=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$id]);
        $result=$stmt->fetch(PDO::FETCH_ASSOC);
        $nom=$result['Nom'];
        return $nom;
    }

    function upload_rapportetd($rapport_id,$filename,$path,$idEtudiant){
        
        global $conn;
        $query="INSERT INTO Rapportetd (IdEtudiant,IdRapport,pdf_nom,pdf_path) VALUES (?,?,?,?);";
        $stmt=$conn->prepare($query);
        $stmt->execute([$idEtudiant,$rapport_id,$filename,$path]);
    }

    function studentHasSubmittedFile($rapport_id,$idEtudiant){
        global $conn;
        $query = "SELECT COUNT(*) AS count FROM Rapportetd WHERE IdEtudiant = ? AND IdRapport = ?";
        $stmt = $conn->prepare($query);
        $stmt->execute([$idEtudiant, $rapport_id]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result['count'] > 0;
    }

}