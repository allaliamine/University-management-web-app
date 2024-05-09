<?php
declare(strict_types=1);
require_once '../config/conn.php';

class postrapportModel {

    // function fetch_rapport(){

    //     global $conn; 
    //     $currentDate = date("Y-m-d");
    //     $niveauetd=$_SESSION['etd'];
    //     $query="SELECT * FROM rapport WHERE IdNiveau=? AND deadline >= ?;";
    //     $stmt=$conn->prepare($query);
    //     $stmt->execute([$niveauetd['IdNiveau'],$currentDate]);
    //     $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
    //     return $result;
    // }


    function fetch_rapport(){
        global $conn; 
        $currentDate = date("Y-m-d");
        $niveauetd = $_SESSION['etd'];
        $query = "SELECT r.*, p.Nom, m.Intitule 
                  FROM rapport r 
                  JOIN prof p ON r.IdProf = p.IdProf
                  JOIN module m ON r.IdModule = m.IdModule 
                  WHERE r.IdNiveau = ? AND r.Deadline >= ?";
        $stmt = $conn->prepare($query);
        $stmt->execute([$niveauetd['IdNiveau'], $currentDate]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
    
    

    function fetch_nommodule(int $id){

        global $conn;
        $query="SELECT * FROM module WHERE IdModule=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$id]);
        $result=$stmt->fetch(PDO::FETCH_ASSOC);
        $nom=$result['Intitule'];
        return $nom;
    }


    function fetch_nomprofesseur(int $id){

        global $conn;
        $query="SELECT * FROM prof WHERE IdProf=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$id]);
        $result=$stmt->fetch(PDO::FETCH_ASSOC);
        $nom=$result['Nom'];
        return $nom;
    }

    function upload_rapportetd($rapport_id,$filename){
        
        global $conn;
        $query="INSERT INTO rapportetd (IdEtudiant,IdRapport,pdf_nom) VALUES (?,?,?);";
        $idEtudiant=$_SESSION['etd']['IdEtudiant'];
        $stmt=$conn->prepare($query);
        $stmt->execute([$idEtudiant,$rapport_id,$filename]);
    }

    function studentHasSubmittedFile($rapport_id){
        global $conn;
        $idEtudiant = $_SESSION['etd']['IdEtudiant'];
        $query = "SELECT COUNT(*) AS count FROM rapportetd WHERE IdEtudiant = ? AND IdRapport = ?";
        $stmt = $conn->prepare($query);
        $stmt->execute([$idEtudiant, $rapport_id]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        return $result['count'] > 0;
    }

}