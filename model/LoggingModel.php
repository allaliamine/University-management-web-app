<?php

// require_once '../config/conn.php';

class logginModel{


    function insertIntoLogging($cne,$ip,$date,$time,$critice,$action,$admin,$idcompte){

        global $conn;

        $req = $conn->prepare('insert into Journalisation (CNE, AdressIP, Date, Heure, Criticite, action, IdAdmin, IdCompte) values (?,?,?,?,?,?,?,?)');

        $params = array($cne,$ip,$date,$time,$critice,$action,$admin,$idcompte);
        $req->execute($params);

    }


    function getAllLogins(){
        global $conn;

        $req = $conn->prepare('select * from Journalisation');
        $req->execute();

        $res = $req->fetchAll();

        return $res;
    }

}








?>