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


}









?>