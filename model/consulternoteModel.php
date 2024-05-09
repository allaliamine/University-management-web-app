<?php
declare(strict_types=1);
require_once '../config/conn.php';

class consulternoteModel {

    function fetch_note($idetudiant){
        global $conn; 
        $query="SELECT module.Intitule, note.Valeur
        FROM note
        JOIN module ON note.idModule = module.IdModule
        WHERE note.idEtudiant = ?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$idetudiant]);
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

}