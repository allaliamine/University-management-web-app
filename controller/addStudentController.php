<?php


require_once '../model/addStudent.php';



class addStudentController{

    private $addStudent;

    public function __construct() {
        $this->addStudent = new addStudent();
    }

    /*function to insert student in database */
    public function insertStudent($nom, $prenom, $cin, $cne, $sexe, $date,$email, $tel, $idcompte, $idrole, $login, $mdp, $idAdmin, $idFiliere){
        $this->addStudent->insertStudent($nom, $prenom, $cin, $cne, $sexe, $date ,$email, $tel, $idcompte, $idrole, $login, $mdp, $idAdmin, $idFiliere);
    }

    /*function to check is student exist in database*/
    public function CheckStudentByCne($cne){
        $student = $this->addStudent->CheckStudentByCne($cne);
        if($student){
            return true;
        }
        else{
            return false;
        }
    }
    
    /*function to add account to database*/
    public function addAccount($login, $mdp){
        $idrole = 2;
        $this->addStudent->addAccount($idrole,$login,$mdp);
    }


    /*function to get account from database*/
    public function getAccountID($login, $password){

        $user = $this->addStudent->getAccountID($login, $password);

        
        return $user;
    }


    




}







?>