<?php

require_once '../model/userModel.php';
require_once '../controller/logController.php';


class AuthController{

    private $userModel;

    public function __construct() {
        $this->userModel = new userModel();
    }

    public function login($login, $password){
        $log = new loginController();

        $user = $this->userModel->getAccountByLoginAndPassword($login, $password);

        if ($user){
            if($user['Activite'] == 'A'){
                
                $_SESSION['success'] = $user;
                $idcompte = $user['IdCompte'];

                switch ($user['Idrole']) {
                    case 1:
                        $prof = $this->userModel->getProfByIdCompte($idcompte);
                        $_SESSION['prof'] = $prof;
                        $log->createAction($prof['CIN'],'info','prof authentifier au compte',$prof['IdCompte']);

                        header('Location: ../views/prof/interface_prof.php');
                        break;
                    case 2:
                        $etd = $this->userModel->getStudentByIdCompte($idcompte);
                        $_SESSION['etd'] = $etd;
                        $log->createAction($etd['CNE'],'info','etudiant authentifier au compte',$etd['IdCompte']);
                        header('Location: ../views/etudiant/interface_Etudiant.php');
                        break;
                    default:
                        $admin = $this->userModel->getAdminByIdCompte($idcompte);
                        $_SESSION['admin'] = $admin;
                        $log->createAction($admin['CIN'],'info','admin authentifier au compte',$admin['IdCompte']);
                        header('Location: ../views/admin/interface_admin.php');
                }
                exit();
            }else{
                $_SESSION['Activite'] = "votre compte est desactiver contacter mr cherradi";
                $log->createAction(NULL,'error','Etudiant authentifier a un compte desactiver',NULL);
                header('Location: ../public/index.php');
            }
        } 

        else {
            $_SESSION['error'] = "Votre login ou mdp est incorrect";
            $log->createAction(NULL,'error','mote de passe ou login incorrect lors de authentification',NULL);
            header('Location: ../public/index.php');
            exit();
        }

    }


}



?>