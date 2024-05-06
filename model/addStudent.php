<?php

require_once '../config/conn.php';


class addStudent{

    /*checking if student exist*/
    public function CheckStudentByCne($cne){

        global $conn;
        
        $req = $conn->prepare('select * from Etudiant where Cne=?');
        $params = array($cne);
        $req->execute($params);
        $res = $req->fetch();

        return $res;

    }

    /*adding student to databse */
    public function insertStudent($nom, $prenom, $cin, $cne, $sexe, $date, $email, $tel, $idcompte, $idrole, $login, $mdp, $idAdmin, $idFiliere){

        global $conn;

        $req = $conn->prepare('INSERT INTO Etudiant ( Nom, Prenom, CIN, CNE, Sexe, Date_naissance, Email, Tel, IdCompte, Idrole, Login, Mdp, IdAdmin, IdFiliere) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');
        $params = array($nom, $prenom, $cin, $cne, $sexe, $date, $email, $tel, $idcompte, $idrole, $login, $mdp, $idAdmin, $idFiliere);
        $req->execute($params);
    }


    /* adding account to database */
    public function addAccount($idrole,$login, $mdp){

        global $conn;

        $req = $conn->prepare('insert into Compte (Idrole, Login, Mdp) values (?, ?, ?)');
        $params = array($idrole, $login, $mdp);
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