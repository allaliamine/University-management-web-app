<?php

require_once '../config/conn.php';

class ProfModel{

    public function getModulesByIdprof($idprof){
        global $conn;
        
            
        $req = $conn->prepare('select * from Module where IdProf=?');
        $params = array($idprof);
        $req->execute($params);
        $res = $req->fetchAll();

        return $res;
    }

    public function getAllStudentByNiveau($idniveau){

        global $conn;

        $req = $conn->prepare('select * from Etudiant where IdNiveau= ?');
        $params = array($idniveau);
        $req->execute($params);
        $res = $req->fetchAll();

        return $res;
    }


    public function insertAbsence($duree,$date,$type,$etat,$prof,$etudiant,$module){
        global $conn;

        $req = $conn->prepare("INSERT INTO Abscence(Duree, Date_abscence, Type, Etat ,IdProf, idEtudiant, idModule) VALUES (?,?,?,?,?,?,?)");
        $params=array($duree,$date,$type,$etat,$prof,$etudiant,$module);
        $req->execute($params);
    }



    // public function isAbsenceAlreadyDone($date,$prof,$module){
    //     global $conn;

    //     $req = $conn->prepare('select * from abscence where Date_abscence=? and IdProf=? and idModule=?');
    //     $params=array($date,$prof,$module);
    //     $req->execute($params);

    //     $res = $req->fetchAll();

    //     return $res;
    // }


    public function getStudentWithAbsence($niveau){

        global $conn;

        $req = $conn->prepare('SELECT e.IdEtudiant, e.Nom, e.Prenom, e.CNE, a.Type ,COUNT(a.IdAbscence) AS NombreAbsences FROM Etudiant e LEFT JOIN Abscence a ON e.IdEtudiant = a.IdEtudiant WHERE e.IdNiveau = ? GROUP BY e.IdEtudiant');
        $req->execute([$niveau]);
        $res = $req->fetchAll();

        return $res;
        
    }


    public function getAbsenceOfStudent($module , $etudiant){
        global $conn;

        $req = $conn->prepare('select e.Nom, e.Prenom, e.CNE, e.IdNiveau ,a.Date_abscence, a.Duree, a.Type , a.IdAbscence , a.Etat from Abscence a inner join Etudiant e on a.idEtudiant = e.IdEtudiant where a.idModule =? and a.idEtudiant = ? ');
        $params = array($module , $etudiant);
        $req->execute($params);

        $res = $req->fetchAll();

        return $res;
    }


    public function justifyAbsence($idAbsence){
        global $conn;

        $req = $conn->prepare("UPDATE Abscence SET Etat = 'J' WHERE IdAbscence = ?");
        $params = array($idAbsence);
        $req->execute($params);

    }


    public function deleteAbsence($idAbsence){
        global $conn;
        
        $req = $conn->prepare("DELETE FROM Abscence WHERE IdAbscence = ?");
        $params = array($idAbsence);
        $req->execute($params);
    }








}



?>