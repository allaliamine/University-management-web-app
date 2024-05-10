<?php

require_once '../model/CoursModel.php';

class CoursController {

    private $cours_model;

    public function __construct(){
        $this ->cours_model = new CoursModel();
        
    }

    function insertcours($file_name ,$type , $IdProf, $IdNiveau){
        
        $type = $this->cours_model ->getCourseType($type);
        return $this ->cours_model ->InsertCours($file_name ,$type , $IdProf, $IdNiveau);
    }


    }










    


 























?>