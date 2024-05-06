<?php

require_once '../model/userModel.php';

class MajorController{

    private $userModel;

    public function __construct() {
        $this->userModel = new userModel();
    }

    public function getAllMajors(){
        $majors = $this->userModel->getAllMajors();

        return $majors;
    }

    public function getAllLevels(){

        $levels = $this->userModel->getAllLevels();

        return $levels;
    }


}

?>