<?php

require_once '../config/conn.php';


class addStudent{

    /*checking if student exist*/
    public function CheckStudentByCne($cne){

        global $conn;
        
        $req = $conn->prepare('select * from Etudiant where CNE=?');
        $params = array($cne);
        $req->execute($params);
        $res = $req->fetch();

        return $res;

    }

    /*adding student to databse */
    public function insertStudent($nom, $prenom, $cin, $cne, $sexe, $date, $email, $tel, $activite ,$idcompte, $idrole, $login, $mdp, $idAdmin, $idNiveau, $idFiliere){

        global $conn;

        $req = $conn->prepare('INSERT INTO Etudiant ( Nom, Prenom, CIN, CNE, Sexe, Date_naissance, Email, Tel, Activite, IdCompte, Idrole, Login, Mdp, IdAdmin, IdNiveau, IdFiliere) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');
        $params = array($nom, $prenom, $cin, $cne, $sexe, $date, $email, $tel, $activite, $idcompte, $idrole, $login, $mdp, $idAdmin, $idNiveau, $idFiliere);
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