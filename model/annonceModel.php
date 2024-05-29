<?php

require_once '../Config/conn.php';


class annonceModel 
{
    
function getAnnonceID($nom){

    global $conn;

    $query = "SELECT * FROM Annonce WHERE Nom_fichier = ?";
    $stm=$conn->prepare($query);
    $stm ->execute([$nom]);
    $result=$stm->fetch(PDO::FETCH_ASSOC);
    $id=$result['IdAnnonce'];
    return $id;

}

function InsertAnnonce($titre,$descriptif,$Nom_fichier,$date){
     
    global $conn;

    $query = "INSERT INTO Annonce (Titre, Descriptif, Nom_fichier ,date, IdAdmin ) VALUES (?,?,?,?,?);";
    $stm = $conn ->prepare($query);
    $stm ->execute([$titre,$descriptif,$Nom_fichier,$date,1]);

}

function InsertAnnonceNiveau($id ,$niveau){
    global $conn;

    $query= "INSERT INTO Annonce_niveau(IdAnnonce, IdNiveau) VALUES (?,?);";
    $stm= $conn->prepare($query);
    $stm ->execute([$id,$niveau]);
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


}
/**
 * end of class safi salina
 * 
 */

?>
