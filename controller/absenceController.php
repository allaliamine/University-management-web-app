<?php

require_once '../model/ProfAbsenceModel.php';

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


    public function insertAbsence($prof,$etudiant,$module){
        $duree = 2;
        $date = date("Y-m-d");

        $this->profModel->insertAbsence($duree, $date,$prof,$etudiant,$module);
    }



    public function isAbsenceAlreadyDone($prof,$module){
        $date = date("Y-m-d");
        $res = $this->profModel->isAbsenceAlreadyDone($date,$prof,$module);

        if($res){
            return true;
        }else{
            return false;
        }

    }

}








?>