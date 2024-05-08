<?php

require_once '../model/annonceModel.php';


class AnnonceController 
{
    
    private $annonce_Model;

    public function __construct() {
        $this->annonce_Model = new annonceModel();
    }


    public function insertAnnonce($nom){
        $this->annonce_Model->InsertAnnonce($nom);
    }

    public function insertAnnonceNiveau($nom, $niveau){

        $id=$this->annonce_Model->getAnnonceID($nom);
        $this->annonce_Model->InsertAnnonceNiveau($id,$niveau);


    }
    public function getAllMajors(){
        $majors = $this->annonce_Model->getAllMajors();

        return $majors;
    }

    public function getAllLevels(){

        $levels = $this->annonce_Model->getAllLevels();

        return $levels;
    }










}

?>