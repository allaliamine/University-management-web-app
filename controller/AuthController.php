<?php

require_once '../model/userModel.php';


class AuthController{

    private $userModel;

    public function __construct() {
        $this->userModel = new userModel();
    }

    public function login($login, $password){

        $user = $this->userModel->getAccountByLoginAndPassword($login, $password);
        if ($user){
            if($user['Activite'] == 'A'){
                session_start();
                $_SESSION['success'] = $user;
                $idcompte = $user['IdCompte'];

                switch ($user['Idrole']) {
                    case 1:
                        $prof = $this->userModel->getProfByIdCompte($idcompte);
                        $_SESSION['prof'] = $prof;
                        header('Location: ../views/prof/interface_prof.php');
                        break;
                    case 2:
                        $etd = $this->userModel->getStudentByIdCompte($idcompte);
                        $_SESSION['etd'] = $etd;
                        header('Location: ../views/etudiant/interface_Etudiant.php');
                        break;
                    default:
                        $admin = $this->userModel->getAdminByIdCompte($idcompte);
                        $_SESSION['admin'] = $admin;
                        header('Location: ../views/admin/interface_admin.php');
                }
                exit();
            }else{
                $_SESSION['Activite'] = "votre compte est desactiver contacter mr cherradi";
            }
        } 

        else {
            $_SESSION['error'] = "Votre login ou mdp est incorrect";
            header('Location: ../public/index.php');
            exit();
        }

    }


}



?>