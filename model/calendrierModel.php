<?php

require_once '../config/conn.php';


class calendrierModel{

   /*insertion de la date du rapport dans la table :*/
    public function insertDelaisRapport($titre,$dateStart,$dateEnd,$idNiveau){

        global $conn;
        
        $req = $conn->prepare('INSERT INTO Calendrierevent (Titre, DateStart, DateEnd, IdNiveau) VALUES (?,?,?,?)');
        $params= array($titre,$dateStart,$dateEnd,$idNiveau);
        $req->execute($params);
        
    }

    /* fetch les annonces de rapport selon le niveau from la table de calendrierevent : */

    public function fetchEventNiveau($idNiveau){
        global $conn;
        $req = $conn->prepare('SELECT * FROM Calendrierevent where IdNiveau =? ');
        $params= ($idNiveau);
        $req->execute([$params]);
        $res = $req->fetchAll();
        return $res;
    }
}