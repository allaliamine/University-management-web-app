<?php
require_once '../Config/conn.php';

class CoursModel {
   
function InsertCours($file_name ,$type , $IdProf, $IdNiveau){
    global $conn ;  
    $query = "INSERT INTO cours (Nom , Type ,IdProf , IdNiveau) VALUES (?,?,?,?) ";
    $stm = $conn->prepare($query);
    $stm->execute([$file_name ,$type , $IdProf, $IdNiveau]);

}

function getCourseType($typeIn){
    switch ($typeIn) {
        case 'cours':
            return 'Cours';  
        case 'tp':
            return 'TD';      
        case 'td':
            return 'TP';      
        default:
           return null;
    }

}


}

?>