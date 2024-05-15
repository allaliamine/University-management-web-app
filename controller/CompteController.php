<?php
require_once '../model/userModel.php';


class CompteController{

    private $userModel;

    public function __construct() {
        $this->userModel = new userModel();
    }

    public function changeAdminInfo($email,$tel,$idAdmin){

        $this->userModel->changeAdminInfo($email,$tel,$idAdmin);
    }

    public function changeAdminpassword($mdp,$idAdmin){

        $this->userModel->changeAdminpassword($mdp,$idAdmin);
    }


    public function changeComptePassword($mdp,$idCompte){
        $this->userModel->changeComptePassword($mdp,$idCompte);
    }

    public function getAdminByIdCompte($idCompte){
        $res = $this->userModel->getAdminByIdCompte($idCompte);
        return $res;
    }


    public function changeProfInfo($email,$tel,$idProf){

        $this->userModel->changeProfInfo($email,$tel,$idProf);
    }

    public function changeProfpassword($mdp,$idProf){

        $this->userModel->changeProfpassword($mdp,$idProf);
    }

    public function getProfByIdCompte($idCompte){
        $res = $this->userModel->getProfByIdCompte($idCompte);
        return $res;
    }


    public function changeEtudiantInfo($email,$tel,$idProf){

        $this->userModel->changeEtudiantInfo($email,$tel,$idProf);
    }

    public function changeEtudiantpassword($mdp,$idProf){

        $this->userModel->changeEtudiantpassword($mdp,$idProf);
    }

    public function getEtudiantByIdCompte($idCompte){
        $res = $this->userModel->getStudentByIdCompte($idCompte);
        return $res;
    }




    




}














?>