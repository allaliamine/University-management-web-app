<?php

require_once '../config/conn.php';


class absenceModel{


    public function insertAbsence($duree,$date,$prof,$etudiant,$module){
        global $conn;

        $req = $conn->prepare('insert into Abscence (Duree, Date_abscence, IdProf, idEtudiant, idModule) values (?,?,?,?,?)');
        $params=array($duree,$date,$prof,$etudiant,$module);
        $req->execute($params);
    }


}







?>