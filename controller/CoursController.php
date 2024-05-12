<?php

require_once '../model/CoursModel.php';

class CoursController {

    private $cours_model;

    public function __construct(){
        $this ->cours_model = new CoursModel();
        
    }

    public function insertcours($file_name ,$type , $IdProf, $IdNiveau, $IdModule){

        $etat = 'desarchiver';
        $type = $this->cours_model ->getCourseType($type);
        return $this ->cours_model ->InsertCours($file_name ,$type ,$etat, $IdProf, $IdNiveau, $IdModule);
    }

    function getAllCours($idprof,$idniveau,$idmodule){
    
        $res = $this->cours_model->getAllCours($idprof,$idniveau,$idmodule);
       
        return $res;
    
    }

    public function archiverCours($idCours){

        $this->cours_model->archiverCours($idCours);
    }

    public function desarchiverCours($idCours){

        $this->cours_model->desarchiverCours($idCours);
    }



    public function getCoursForStudent($idmodule){
        $res = $this->cours_model->getCoursForStudent($idmodule);

        return $res;
    }


    public function getModulesByniveau($idniveau){


        $res = $this->cours_model->getModulesByniveau($idniveau);

        return $res;

    }


}



?>