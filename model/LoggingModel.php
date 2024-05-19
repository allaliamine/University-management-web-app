<?php

require_once '../config/conn.php';

class logginModel{


    function insertIntoLogging($cne,$ip,$date,$time,$critice,$action,$admin,$idcompte){

        global $conn;

        $req = $conn->prepare('insert into Journalisation (CNE, AdressIP, Date, Heure, Criticite, action, IdAdmin, IdCompte) values (?,?,?,?,?,?,?,?)');

        $params = array($cne,$ip,$date,$time,$critice,$action,$admin,$idcompte);
        $req->execute($params);

    }


    function getAllLogins(){
        global $conn;

        $req = $conn->prepare('select * from Journalisation order by Date desc, Heure desc');
        $req->execute();
        $res = $req->fetchAll();

        return $res;
    }


    function getAllAuthentifications($message,$dates){

        global $conn;
        $counts = [];

        foreach($dates as $date){
            $req = $conn->prepare("select count(*) from Journalisation where action like ? and Date = ?");
            $params = array($message,$date);
            $req->execute($params);
            $res = $req->fetch();

            $counts[] = $res;

        }
        return $counts;
    }


    function getLoginbycne($cne){
        global $conn;


        $req = $conn->prepare('select * from Journalisation where CNE = ? order by Date desc, Heure desc');
        $params = array($cne);
        $req->execute($params);
        $res = $req->fetchAll();


        return $res;

    }
}








?>