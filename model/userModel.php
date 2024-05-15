<?php

require_once '../config/conn.php';


class userModel{

    public function getAccountByLoginAndPassword($login , $password){

        global $conn;
        
        $req = $conn->prepare('select * from Compte where Login=? and Mdp=?');
        $params = array($login, $password);
        $req->execute($params);
        $res = $req->fetch();

        return $res;
    }


    public function getAllMajors(){
        global $conn;
        
        $req = $conn->prepare('select * from Filiere');
        $req->execute();
        $res = $req->fetchAll();

        return $res;
    }


    public function getAllLevels(){
        global $conn;
        
        $req = $conn->prepare('select * from Niveau');
        $req->execute();
        $res = $req->fetchAll();

        return $res;
    }


    public function getStudentByIdCompte($idcompte){
        global $conn;
        
        $req = $conn->prepare('select * from Etudiant where IdCompte=?');
        $params = array($idcompte);
        $req->execute($params);
        $res = $req->fetch();

        return $res;

    }

    public function getProfByIdCompte($idcompte){
        global $conn;
        
        $req = $conn->prepare('select * from Prof where IdCompte=?');
        $params = array($idcompte);
        $req->execute($params);
        $res = $req->fetch();

        return $res;

    }


    public function getAdminByIdCompte($idcompte){
        global $conn;
        
        $req = $conn->prepare('select * from Admin where IdCompte=?');
        $params = array($idcompte);
        $req->execute($params);
        $res = $req->fetch();

        return $res;

    }

    
    public function changeAdminInfo($email,$tel,$idAdmin){
    
        global $conn;
        
        $req = $conn->prepare(' UPDATE Admin SET Email = ?, Tel = ? WHERE IdAdmin = ? ');
        $params = array($email,$tel,$idAdmin);
        $req->execute($params);
        
    }

    public function changeAdminpassword($mdp,$idAdmin){
    
        global $conn;
        
        $req = $conn->prepare(" UPDATE `Admin` SET `Mdp`= ? WHERE IdAdmin = ? ");
        $params = array($mdp,$idAdmin);
        $req->execute($params);
    }

    function changeComptePassword($mdp,$idCompte){
        global $conn;

        $req = $conn->prepare("UPDATE `Compte` SET `Mdp`= ? WHERE IdCompte = ?");
        $params = array($mdp,$idCompte);
        $req->execute($params);

    }


    public function changeProfInfo($email,$tel,$idProf){
    
        global $conn;
        
        $req = $conn->prepare(' UPDATE Prof SET Email = ?, Tel = ? WHERE IdProf = ? ');
        $params = array($email,$tel,$idProf);
        $req->execute($params);
        
    }

    public function changeProfpassword($mdp,$idProf){
    
        global $conn;
        
        $req = $conn->prepare(" UPDATE `Prof` SET `Mdp`= ? WHERE IdProf = ? ");
        $params = array($mdp,$idProf);
        $req->execute($params);
    }


    public function changeEtudiantInfo($email,$tel,$idEtd){
    
        global $conn;
        
        $req = $conn->prepare(' UPDATE Etudiant SET Email = ?, Tel = ? WHERE IdEtudiant = ? ');
        $params = array($email,$tel,$idEtd);
        $req->execute($params);
        
    }

    public function changeEtudiantpassword($mdp,$idEtd){
    
        global $conn;
        
        $req = $conn->prepare(" UPDATE `Etudiant` SET `Mdp`= ? WHERE IdEtudiant = ? ");
        $params = array($mdp,$idEtd);
        $req->execute($params);
    }



}









?>