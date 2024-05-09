<?php

require_once '../config/conn.php';


class studentModel{



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