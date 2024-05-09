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


    public function insertAbsence($duree,$date,$prof,$etudiant,$module){
        global $conn;

        $req = $conn->prepare('insert into Abscence (Duree, Date_abscence, IdProf, idEtudiant, idModule) values (?,?,?,?,?)');
        $params=array($duree,$date,$prof,$etudiant,$module);
        $req->execute($params);
    }



    public function isAbsenceAlreadyDone($date,$prof,$module){
        global $conn;

        $req = $conn->prepare('select * from abscence where Date_abscence=? and IdProf=? and idModule=?');
        $params=array($date,$prof,$module);
        $req->execute($params);

        $res = $req->fetchAll();

        return $res;
    }








}



?>