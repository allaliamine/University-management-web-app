<?php

require_once '../config/conn.php';

class ProfModel{

    public function getModulesByIdprof($idprof){
        global $conn;
        
            
        $req = $conn->prepare('select * from Module where IdProf=9');
        $params = array($idprof);
        $req->execute();
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








}



?>