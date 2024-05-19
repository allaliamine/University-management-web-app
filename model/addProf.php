<?php

require_once '../config/conn.php';


class addProf{

    /*checking if student exist*/
    public function CheckProf($cin){

        global $conn;
        
        $req = $conn->prepare('select * from Prof where CIN=?');
        $params = array($cin);
        $req->execute($params);
        $res = $req->fetch();

        return $res;
    }

    /*adding student to databse */
    public function insertProf($nom, $prenom, $cin, $email, $tel, $activite ,$idcompte, $idrole, $login, $mdp){

        global $conn;

        $req = $conn->prepare('INSERT INTO Prof(Nom, Prenom, CIN, Email, Tel, Activite, IdCompte, Idrole, Login, Mdp) VALUES (?,?,?,?,?,?,?,?,?,?)');
        $params = array($nom, $prenom, $cin, $email, $tel, $activite, $idcompte, $idrole, $login, $mdp);
        $req->execute($params);
    }


    /* adding account to database */
    public function addAccount($idrole,$login, $mdp){

        global $conn;

        $req = $conn->prepare('insert into Compte (Idrole, Login, Mdp, Activite) values (?, ?, ?, ?)');
        $activite = 'A';
        $params = array($idrole, $login, $mdp, $activite);
        $req->execute($params);
    }


    public function getAccountID($login , $password){

        global $conn;
        
        $req = $conn->prepare('select * from Compte where Login=? and Mdp=?');
        $params = array($login, $password);
        $req->execute($params);
        $res = $req->fetch();
        $id = $res['IdCompte'];

        return $id;
    }







}









?>