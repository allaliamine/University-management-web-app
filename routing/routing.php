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

    require_once '../controller/MajorController.php';

    session_start();

    $action = $_GET['action'];

    if ($action == "add") {

        $majorController = new MajorController();
        $majors = $majorController->getAllMajors();
        $levels = $majorController->getAllLevels();

        $_SESSION['majors'] = $majors;
        $_SESSION['levels'] = $levels;
        header('location: ../views/admin/ajout_etudiants.php');
        
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




?>

