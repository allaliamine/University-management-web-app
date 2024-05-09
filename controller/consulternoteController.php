<?php
declare(strict_types=1);

require_once '../model/consulternoteModel.php';

class consulternoteController{

    private $consulternote_model;

    public function __construct() {
        $this->consulternote_model = new consulternoteModel();
    }

    function fetch_note($idetudiant){
        $result=$this->consulternote_model->fetch_note($idetudiant);
        return $result;
    }
  
}