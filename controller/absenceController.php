<?php

require_once '../model/ProfModel.php';

class absenceController{

    private $profModel;

    public function __construct() {
        $this->profModel = new ProfModel();
    }


    public function getModulesByIdprof($idprof){
        
        $modules = $this->profModel->getModulesByIdprof($idprof);

        return $modules;
    }

    public function getAllStudentByNiveau($idniveau){

        $students = $this->profModel->getAllStudentByNiveau($idniveau);

        return $students;

    }


    // public function




}








?>