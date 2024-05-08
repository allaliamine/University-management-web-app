<?php

use PhpOffice\PhpSpreadsheet\Reader\Xlsx;

/**
 * pour Authentification
 */
if ( isset($_POST['submit']) ) {

    include '../controller/AuthController.php';

    $login = $_POST['login'];
    $password =  $_POST['password'];

    try {
        $authController = new AuthController();
        $authController->login($login, $password);

    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
 
}


/**
 * pour avoir les filieres et les niveaux
 */
if(isset($_GET['action'])){

    session_start();

    $action = $_GET['action'];


    switch ($action){

        case 'note':
        require_once '../controller/noteController.php';

        $majorController = new noteController();
        $majors = $majorController->fetch_filier();
        $levels = $majorController->fetch_niveau();
        $modules=$majorController->fetch_module();

        $_SESSION['majors'] = $majors;
        $_SESSION['levels'] = $levels;
        $_SESSION['modules'] = $modules;

        header("location: ../views/admin/publier_note.php");
        exit();
        break;
        
    

        case 'add':
        require_once '../controller/MajorController.php';

        $majorController = new MajorController();
        $majors = $majorController->getAllMajors();
        $levels = $majorController->getAllLevels();

        $_SESSION['majors'] = $majors;
        $_SESSION['levels'] = $levels;
        header("location: ../views/admin/ajout_etudiants.php");
        exit();
        break;


        case 'rapportprof':
        require_once '../controller/rapportController.php';

        $moduleController = new rapportController();
        $levels=$moduleController->fetch_niveau();
        $modules=$moduleController->fetch_module();

        $_SESSION['levels'] = $levels;
        $_SESSION['modules'] = $modules;

        header("location: ../views/prof/rapport.php");
        exit();
        break;



        case 'prof':
      
        require_once '../controller/MajorController.php';
        require_once '../controller/absenceController.php';

        $idprof = $_SESSION['prof']['IdProf'];

        $majorController = new MajorController();
        $absenceController = new absenceController();

        $majors = $majorController->getAllMajors();
        $levels = $majorController->getAllLevels();
        $module = $absenceController->getModulesByIdprof($idprof);


        $_SESSION['majors'] = $majors;
        $_SESSION['levels'] = $levels;
        $_SESSION['prf_mdls'] = $module;
        

        header('location: ../views/prof/faire_absence.php');
        exit();
        break;

        default:
        break;





    } 
    
}


/**
 * pour inserer le compte et etudiant
 */

 if(isset($_POST['ajout-etudiant'])){

    require '../vendor/autoload.php';
    require_once '../controller/addStudentController.php';
    session_start();

    if(!empty($_FILES['file_etudiant']['name'])){

        $file_tmp = $_FILES['file_etudiant']['tmp_name'];
        $filiere = $_POST['filiere'];
        $niveau = $_POST['niveau'];

        
        $reader = new Xlsx;
        $spreadsheet = $reader->load($file_tmp);
        $worksheet = $spreadsheet->getActiveSheet();
        $worksheet_arr = $worksheet->toArray();

        foreach ($worksheet_arr as $row) {

            $nom = $row[0];
            $prenom = $row[1];
            $cin = $row[2];
            $cne = $row[3];
            $sexe = $row[4];
            $date= $row[5];
            $email = $row[6];
            $tel = $row[7];
            $login = $prenom.$nom."@etu.uae.ac.ma";
            $mdp = $prenom."123";
            $idrole = 2;
            $idadmin = 1;
           $addStudent = new addStudentController();

            $checkStudent = $addStudent->CheckStudentByCne($cne);

            if(!$checkStudent){

                $addStudent->addAccount($login,$mdp);

                $idcompte = $addStudent->getAccountID($login, $mdp);
                
                $addStudent->insertStudent($nom, $prenom, $cin, $cne, $sexe, $date, $email, $tel, $idcompte, $idrole ,$login, $mdp, $idadmin, $niveau,$filiere);
                $_SESSION['ajouterEtudiant'] = "les Etudiant on ete ajouter avec succes \n les comptes des etudiants on ete creer avec succes";
            }
        }

        header('location: ../views/admin/ajout_etudiants.php');
    }


 }

//Pour ajouter les notes



if(isset($_POST['importSubmit'])){ 

    session_start();

    require '../vendor/autoload.php';
    require_once '../controller/noteController.php';

    $excelMimes = array('text/xls', 'text/xlsx', 'application/excel', 'application/vnd.msexcel', 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');  
    
    if(!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $excelMimes)){ 
        
        if(is_uploaded_file($_FILES['file']['tmp_name'])){ 

            $etd=new noteController();

            $reader = new Xlsx(); 
            $spreadsheet = $reader->load($_FILES['file']['tmp_name']); 
            $worksheet = $spreadsheet->getActiveSheet();  
            $worksheet_arr = $worksheet->toArray(); 
            
            // Remove header row 
            unset($worksheet_arr[0]); 
            foreach($worksheet_arr as $row){ 
                $CNE = $row[0]; 
                $Valeur = $row[1];
                $id=$etd->get_id_etd($CNE);

                $id_module=$_POST['module'];


                $conn->query("INSERT INTO note(Valeur, idModule, idAdmin, idEtudiant) VALUES ('".$Valeur."','".$id_module."', '1', '".$id."')"); 
            } 
            $_SESSION['etat_note_succes']='Les notes ont ete ajoutes avec succes';
            
        }else{  
            $_SESSION['etat_note_erreur']='Un erreur est survenue contactez Mr Cherradi';
        } 
    }else{ 
        $_SESSION['etat_note_fail']='Fichier unvalide, format insuportable';
    } 
} 
 
// Redirect to the listing page 
//header("Location: ../views/admin/publier_note.php"); 


//Pour ajouter rapport prof

if(isset($_POST['rapportsubmit'])){ 

    session_start();
    require_once '../controller/rapportController.php';

    $Descriptive=$_POST['textarea'];
    $Datelimite=$_POST['date'];
    $idProf=$_SESSION['prof']['IdProf'];
    $IdNiveau=$_POST['niveau'];
    $idModule=$_POST['module'];

    $rapportController = new rapportController();
    $rapportController->upload_rapportprof($Descriptive,$idProf,$IdNiveau,$idModule,$Datelimite);

    header('location: ../views/prof/rapport.php');

    $_SESSION['etat_rapport_succes']='Le rapport est publie avec succes';
    
}else{
    header('location: ../views/prof/rapport.php');
    $_SESSION['etat_rapport_fail']='Un erreur est survenue';
} 
 

