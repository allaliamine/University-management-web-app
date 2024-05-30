<?php


require_once '../model/addProf.php';



class addProfController{

    private $addProf;

    public function __construct() {
        $this->addProf = new addProf();
    }

    /*function to insert Prof in database */
    public function insertProf($nom, $prenom, $cin,$email, $tel, $idcompte, $login, $mdp){
        $activite = 'A';
        $idrole = 1;
        $this->addProf->insertProf($nom, $prenom, $cin,$email, $tel, $activite ,$idcompte, $idrole, $login, $mdp);
    }

    /*function to check is Prof exist in database*/
    public function CheckProfByCne($cin){
        $Prof = $this->addProf->CheckProf($cin);
        if($Prof){
            return true;
        }
        else{
            return false;
        }
    }
    
    /*function to add account to database*/
    public function addAccount($login, $mdp){
        $idrole = 1;
        $this->addProf->addAccount($idrole,$login,$mdp);
    }


    /*function to get account from database*/
    public function getAccountID($login, $password){

        $user = $this->addProf->getAccountID($login, $password);

        return $user;
    }


    public function getAllProfs(){
        $res = $this->addProf->getAllProfs();

        return $res;
    }

    public function desactiverProf($idprof, $idcompte){
        $this->addProf->desactiverProf($idprof,$idcompte); 
    }

    public function activerProf($idprof, $idcompte){
        $this->addProf->activerProf($idprof,$idcompte); 
    }
    

    public function addProf(){

        $prof = new addProfController();

        if(!empty($_POST['NomProf']) && !empty($_POST['PrenomProf']) && !empty($_POST['CinProf']) && !empty($_POST['emailProf']) && !empty($_POST['NumProf']) ){

            $pattern = "/^0\d{9}$/";

            $nom = $_POST['NomProf'];
            $prenom = $_POST['PrenomProf'];
            $cin = $_POST['CinProf'];
            $tel = $_POST['NumProf'];
            $email = $_POST['emailProf'];

            $login = $nom.$prenom."@uae.prof.ac.ma";
            $mdp = $nom."123";

            if(preg_match($pattern, $tel) && filter_var($email, FILTER_VALIDATE_EMAIL) ){

                $checkProf= $prof->CheckProfByCne($cin);

                if(!$checkProf){

                    $prof->addAccount($login,$mdp);
                    $tel = (int)$tel;

                    $idcompte = $prof->getAccountID($login, $mdp);
                    $idcompte = (int)$idcompte;

                    try{
                        $prof->insertProf($nom,$prenom,$cin,$email,$tel,$idcompte,$login,$mdp);
                        $_SESSION['insert-success'] = "le prof a ete ajouter avec succes \n le comptes de prof a ete creer avec succes";
                    }catch (Throwable $e){
                        $_SESSION['insert-error'] = "erreur lors de l'insertion";
                    }
                    // $log->createAction($_SESSION['admin']['CIN'],'info','admin: a ajouter des etudiant ', $_SESSION['admin']['IdCompte']);
                }else{
                    $_SESSION['already-exist'] = "le professeur exist deja";
                }

            }else{
                $_SESSION['invalide-info'] = "format de CIN ou Numere de telephone ou Email invalide";
            }


        }else{
            $_SESSION['emty-info'] = "remplir tous les criteres svp !!";
        }

        header('location: ../views/admin/ajouter_prof.php');
    }


}







?>