<?php
declare(strict_types=1);

require_once '../model/rapportModel.php';

class rapportController{

    private $rapport_model;

    public function __construct() {
        $this->rapport_model = new rapportModel();
    }

    function fetch_niveau(){
        $result=$this->rapport_model->fetch_niveau();
        return $result;
    }

    function fetch_module(){
        $result=$this->rapport_model->fetch_module();
        return $result;
    }

    function upload_rapportprof($Descriptive,$idProf,$IdNiveau,$idModule,$Datelimite){
        $this->rapport_model->upload_rapportprof($Descriptive,$idProf,$IdNiveau,$idModule,$Datelimite);
    }
}