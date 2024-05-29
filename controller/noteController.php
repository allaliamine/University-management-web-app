<?php
declare(strict_types=1);

require_once '../model/noteModel.php';



class noteController{

    private $note_model;

    public function __construct() {
        $this->note_model = new noteModel();
    }
    
    public function fetch_filier(){
        $result= $this->note_model->fetch_filier();
        return $result;
    }

    function fetch_niveau(){
        $result=$this->note_model->fetch_niveau();
        return $result;
    }
    
    function fetch_module(){
        $result=$this->note_model->fetch_module();
        return $result;
    }
    
    function id_niveau(string $nom){
        $result=$this->note_model->id_niveau($nom);
        return $result;
    }
    
    
    function upload_note(float $Valeur, int $idModule, int $idAdmin, int $idEtudiant){
        $this->note_model->upload_note($Valeur,$idModule,$idAdmin,$idEtudiant);
    }
    
    function get_id_etd(string $CNE){
        $result=$this->note_model->get_id_etd($CNE);
        return $result;
    }
    
    function get_id_module(string $module){
        $result=$this->note_model->get_id_module($module);
        return $result;
    }

    function check_cne_exist(string $CNE){
        $result=$this->note_model->check_cne_exist($CNE);
        return !empty($result);
    }


}


