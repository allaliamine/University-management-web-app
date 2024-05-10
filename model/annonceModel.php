<?php

require_once '../Config/conn.php';


class annonceModel 
{
    
function getAnnonceID($nom){

    global $conn;

    $query = "SELECT * FROM annonce WHERE Titre=?;";
    $stm=$conn->prepare($query);
    $stm ->execute([$nom]);
    $result=$stm->fetch(PDO::FETCH_ASSOC);
    $id=$result['IdAnnonce'];
    return $id;

}

function InsertAnnonce($nom){
     
    global $conn;
    $query = "INSERT INTO annonce (Titre , IdAdmin ) VALUES (?,?);";
    $stm = $conn ->prepare($query);
    $stm -> execute ([$nom,1]);

}

function InsertAnnonceNiveau($id ,$niveau){
    global $conn;

    $query= "INSERT INTO annonce_niveau(IdAnnonce, IdNiveau) VALUES (?,?);";
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
