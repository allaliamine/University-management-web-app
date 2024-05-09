<?php
declare(strict_types=1);

require_once '../model/postrapportModel.php';

class postrapportController{

    private $postrapport_model;

    public function __construct() {
        $this->postrapport_model = new postrapportModel();
    }

    function fetch_rapport(){
        $result=$this->postrapport_model->fetch_rapport();
        return $result;
    }

    function fetch_nommodule(int $id){
        $result=$this->postrapport_model->fetch_nommodule($id);
        return $result;
    }

    function fetch_nomprofesseur(int $id){
        $result=$this->postrapport_model->fetch_nomprofesseur($id);
        return $result;
    }

    function upload_rapportetd($rapport_id,$filename,$path,$idEtudiant){
        $this->postrapport_model->upload_rapportetd($rapport_id,$filename,$path,$idEtudiant);
    }
    function studentHasSubmittedFile($rapport_id,$idEtudiant){
        $result=$this->postrapport_model->studentHasSubmittedFile($rapport_id,$idEtudiant);
        return $result;
    }
}