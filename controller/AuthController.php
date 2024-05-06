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

                switch ($user['Idrole']) {
                    case 1:
                        header('Location: ../views/prof/interface_prof.php');
                        break;
                    case 2:
                        header('Location: ../views/etudiant/interface_Etudiant.php');
                        break;
                    default:
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

/*if ( isset($_POST['submit']) ) {

    $login = $_POST['login'];
    $password =  $_POST['password'];

    try {
        $authController = new AuthController();
        $authController->login($login, $password);

    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
 
}*/



?>