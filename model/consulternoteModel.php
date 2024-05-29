<?php
declare(strict_types=1);
require_once '../config/conn.php';

class consulternoteModel {

    function fetch_note($idetudiant){
        global $conn; 
        $query="SELECT Module.Intitule, Note.Valeur
        FROM Note
        JOIN Module ON Note.idModule = Module.IdModule
        WHERE Note.idEtudiant = ?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$idetudiant]);
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

}