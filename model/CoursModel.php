<?php
require_once '../config/conn.php';

class CoursModel {
   
function InsertCours($file_name ,$type ,$etat, $IdProf, $IdNiveau, $IdModule){
    global $conn ;  
    $query = "INSERT INTO Cours (Nom , Type , etat , IdProf , IdNiveau, IdModule) VALUES (?,?,?,?,?,?) ";
    $stm = $conn->prepare($query);
    $stm->execute([$file_name , $type, $etat, $IdProf, $IdNiveau, $IdModule]);

}

function getCourseType($typeIn){
    switch ($typeIn) {
        case 'cours':
            return 'Cours';  
        case 'tp':
            return 'TD';      
        case 'td':
            return 'TP';      
        default:
           return null;
    }

}


function getAllCours($idprof,$idniveau,$idmodule){
    global $conn;

    $req = $conn->prepare('select * from Cours where IdNiveau = ? and IdProf = ? and IdModule = ?');
    $params = array($idniveau,$idprof,$idmodule);
    $req->execute($params);
    $res = $req->fetchAll();

    return $res;

}

function archiverCours($idCours){

    global $conn;

    $req = $conn->prepare("update Cours set etat = 'archiver' WHERE IdCours = ?");
    $params = array($idCours);
    $req->execute($params);
}

function desarchiverCours($idCours){

    global $conn;

    $req = $conn->prepare(" update Cours set etat = 'desarchiver' WHERE IdCours = ?");
    $params = array($idCours);
    $req->execute($params);
}



function getCoursForStudent($idmodule){
    global $conn;

    $query = "SELECT Cours.IdCours, Cours.Nom AS Nom_Cours, Cours.Type, Module.Intitule AS Nom_Module,
    Niveau.Nom AS Nom_Niveau
    FROM 
        Cours
    INNER JOIN 
        Prof ON Cours.IdProf = Prof.IdProf
    INNER JOIN 
        Module ON Cours.IdModule = Module.IdModule
    INNER JOIN 
        Niveau ON Cours.IdNiveau = Niveau.IdNiveau
    WHERE 
        Cours.etat = 'desarchiver'
        AND 
        Module.IdModule = ?";

    $req = $conn->prepare($query);
    $req->execute([$idmodule]);

    $res = $req->fetchAll();

    return $res;

}



function getModulesByniveau($idniveau){
    global $conn;

    $req = $conn->prepare('SELECT Module.IdModule, Module.Intitule, Prof.Nom AS Nom_Professeur, Prof.Prenom AS Prenom_Professeur FROM Module INNER JOIN Prof ON Module.IdProf = Prof.IdProf WHERE Module.IdNiveau = ?');
    $params = array($idniveau);
    $req->execute($params);

    $res = $req->fetchAll();

    return $res;
}


}

?>