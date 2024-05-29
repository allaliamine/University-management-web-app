<?php

use PhpOffice\PhpSpreadsheet\Reader\Xlsx;
use PhpOffice\PhpSpreadsheet\IOFactory;

require_once '../controller/logController.php';

$log = new loginController();


$excelMimes = array(
    'text/xls', 
    'text/xlsx',
    'application/excel',
    'application/vnd.msexcel', 
    'application/vnd.ms-excel', 
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
);  

/////////////////////////////////////////////////////////////////////////////////
    /**
     * pour Authentification
     */
if ( isset($_POST['submit']) ) {
    session_start();
    include '../controller/AuthController.php';

    $login = $_POST['login'];
    $password =  $_POST['password'];

    try {
        $authController = new AuthController();
        $res = $log->getAllAuthentifications();


        $res = json_encode($res);


        $_SESSION['chart'] = $res;

        $authController->login($login, $password);

    } catch (Throwable $e) {
        echo "Error: " . $e->getMessage();
    }
 
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * redirection est recuperation des donnees pour les champs de sidebar(etd, prf, admin)
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_GET['action'])){

    session_start();

    $action = $_GET['action'];
    require_once '../controller/logController.php';
    require_once '../controller/notificationEtudController.php';

    $notificationEtudController = new notificationEtudController();
    $notification = $notificationEtudController->getAllNotification();
    $_SESSION['allnotification'] = $notification;


    $log = new loginController();

    if( isset($_SESSION['etd']) ){


        $numberOfAllNotif = $notificationEtudController->getNotif();
        $seenBystudent = $notificationEtudController->getSeenNotifOfStudent($_SESSION['etd']['IdEtudiant']);

        $_SESSION['countNotif'] = $numberOfAllNotif;    
        $_SESSION['countSeenNotif'] = $seenBystudent;    

        
        
    }


    switch ($action){

        case 'note': /* publier note pour prof */

            require_once '../controller/noteController.php';

            $majorController = new noteController();
            $majors = $majorController->fetch_filier();
            $levels = $majorController->fetch_niveau();
            $modules=$majorController->fetch_module();

            $_SESSION['majors'] = $majors;
            $_SESSION['levels'] = $levels;
            $_SESSION['modules'] = $modules;
            

            $log->createAction($_SESSION['admin']['CIN'],'info','admin: est allé à "publier note" ', $_SESSION['admin']['IdCompte']);
            
            header("location: ../views/admin/publier_note.php");
            exit();
            break;
        
    

        case 'add': /* ajouter etd admin */

            require_once '../controller/MajorController.php';

            $majorController = new MajorController();
            $majors = $majorController->getAllMajors();
            $levels = $majorController->getAllLevels();

            $_SESSION['majors'] = $majors;
            $_SESSION['levels'] = $levels;

            $log->createAction($_SESSION['admin']['CIN'],'info','admin: est allé à "ajouter etudiant" ', $_SESSION['admin']['IdCompte']);

            header("location: ../views/admin/ajout_etudiants.php");
            exit();
            break;

        case 'remove':/* desactive compte des etds */
            require_once "../controller/deleteStudentController.php";

            $deleteStudentController = new deleteStudentController();

            $fieldLevel = $deleteStudentController->FieldLevel();

            $_SESSION['FieldLevel'] = $fieldLevel;

            $log->createAction($_SESSION['admin']['CIN'],'info','admin: est allé à "retrancher etudiant" ', $_SESSION['admin']['IdCompte']);

            header('location: ../views/admin/deleteStudent.php');
            exit();
            break;


        case 'rapportprof': /* publier un nv rapport pour prof */
            require_once '../controller/rapportController.php';

            $prof=$_SESSION['prof'];
            $moduleController = new rapportController();
            $levels=$moduleController->fetch_niveau();
            $modules=$moduleController->fetch_module($prof);

            $_SESSION['levels'] = $levels;
            $_SESSION['modules'] = $modules;

            

            $log->createAction($_SESSION['prof']['CIN'],'info','prof: est allé à "Rapport" ', $_SESSION['prof']['IdCompte']);

            header('location: ../views/prof/rapport.php');
            exit();
            break;



        case 'absenceprof': /* faire et consulter l'absence */
      
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

            if($_GET['id'] == 'faire'){
                $log->createAction($_SESSION['prof']['CIN'],'info','prof: est allé à "Gestion des Absences" ', $_SESSION['prof']['IdCompte']);
                header('location: ../views/prof/faire_absence.php');
                exit();
                break;
            }elseif($_GET['id'] == 'voir'){ 
                $log->createAction($_SESSION['prof']['CIN'],'info','prof: est allé à "Etudiants pour consulter les absences" ', $_SESSION['prof']['IdCompte']);
                header('location: ../views/prof/get_students.php');
                exit();
                break;
            }



        case 'annonce': /* publier annonce pour admin */

            require_once '../controller/AnnonceController.php';  
    
            $annonceController = new AnnonceController();
            $majors = $annonceController->getAllMajors();
            $levels = $annonceController->getAllLevels();
    
            $_SESSION['majors'] = $majors;
            $_SESSION['levels'] = $levels;

            $log->createAction($_SESSION['admin']['CIN'],'info','admin: est allé à "publier annonce" ', $_SESSION['admin']['IdCompte']);
    
            header('location: ../views/admin/publier_annonce.php');
            exit();
            break;

        case 'consulterrapportprof': /* consulter les rapport prof*/
            
            require_once '../controller/rapportController.php';

            $moduleController = new rapportController();
            $prof=$_SESSION['prof'];
            $levels=$moduleController->fetch_niveau();
            $modules=$moduleController->fetch_module($prof);

            $_SESSION['levels'] = $levels;
            $_SESSION['modules'] = $modules;
            $log->createAction($_SESSION['prof']['CIN'],'info','prof: est allé à "Consulter Rapport" ', $_SESSION['prof']['IdCompte']);

            header("location: ../views/prof/consulter_rapport.php");
            exit();
            break;

        case 'rapportetd': /* etd : consulter les rapport et les postuler */
            require_once '../controller/postrapportController.php';

            $postrapportController= new postrapportController();
            $rapport=$postrapportController->fetch_rapport();
            $_SESSION['toutrapport']=$rapport;
            $log->createAction($_SESSION['etd']['CNE'],'info','etd: est allé à "Rapport" ', $_SESSION['etd']['IdCompte']);
            header('location: ../views/etudiant/postuler_rapport.php');
            exit();
            break;


        case 'noteetd': /* etd : consulter les notes */
            require_once '../controller/consulternoteController.php';
            $etdnoteController=new consulternoteController();
            $idetudiant=$_SESSION['etd']['IdEtudiant'];
            
            $notes=$etdnoteController->fetch_note($idetudiant);
            $_SESSION['notes']=$notes;
            $log->createAction($_SESSION['etd']['CNE'],'info','etd: est allé à "Note" ', $_SESSION['etd']['IdCompte']);
            header('location: ../views/etudiant/consulter_note.php');
            exit();
            break;
        
        case 'cours': /* publier les couurs prof*/
            require_once '../controller/CoursController.php';
            require_once '../controller/rapportController.php';

            $coursController = new CoursController();
            $moduleController = new rapportController();

            $prof=$_SESSION['prof'];
            $levels=$moduleController->fetch_niveau();
            $modules=$moduleController->fetch_module($prof);

            $_SESSION['levels'] = $levels;
            $_SESSION['modules'] = $modules;
            $log->createAction($_SESSION['prof']['CIN'],'info',"prof: est allé à 'Cours' ", $_SESSION['prof']['IdCompte']);

            header('location: ../views/prof/publier_cours.php');
            exit();
            break;

        case 'details': /* avoir les details des absence prof */

            require_once '../controller/absenceController.php';

            $id = $_GET['id'];
            var_dump($_SESSION['abs_mdl']);
            $module =  $_SESSION['abs_mdl'];

            

            $etd = new absenceController();

            $details = $etd->getAbsenceOfStudent($module, $id);
            if(!empty($details)){
                $_SESSION['details'] = $details;
            }else{
                $_SESSION['details_message_shown']= "pas de d'absence donc pas de details !";
            }

            $log->createAction($_SESSION['prof']['CIN'],'info',"prof: a vu les details d'absence d'un etudiant", $_SESSION['prof']['IdCompte']);
            header('location: ../views/prof/get_studentsfn.php');

            exit();
            break;


        case 'archiverCours': /* archiver cours pour prof */
            require_once '../controller/CoursController.php';
            require_once '../controller/rapportController.php';

            $coursController = new CoursController();
            $moduleController = new rapportController();

            $prof=$_SESSION['prof'];
            $levels=$moduleController->fetch_niveau();
            $modules=$moduleController->fetch_module($prof);

            $_SESSION['levels'] = $levels;
            $_SESSION['modules'] = $modules;
            $log->createAction($_SESSION['prof']['CIN'],'info','prof: est allé à "gestion des cours" ', $_SESSION['prof']['IdCompte']);

            header('location: ../views/prof/get_cours.php');
            exit();
            break;



        case 'getAllCours': 
        
            require_once '../controller/CoursController.php';
            $coursController = new CoursController();

            $idniveau = $_SESSION['etd']['IdNiveau'];

            if($_GET['etape'] == 1){
                $moduleOfniveau = $coursController->getModulesByniveau($idniveau);

                $_SESSION['lvl_mdls']= $moduleOfniveau;
                $log->createAction($_SESSION['etd']['CNE'],'info','etd: est allé à "Cours" ', $_SESSION['etd']['IdCompte']);
                header('location: ../views/etudiant/consulter_cours.php');
                exit();
                break;

            }elseif($_GET['etape'] == 2){

                $idmodule = $_GET['id'];
                
                $etu_cours = $coursController->getCoursForStudent($idmodule);
                $_SESSION['etu_cours'] = $etu_cours;
                $log->createAction($_SESSION['etd']['CNE'],'info','etd: est allé consulter les cours de module ', $_SESSION['etd']['IdCompte']);

                header('location: ../views/etudiant/consulter_coursfn.php');
                exit();
                break;

            }   

        case 'notification':
            require_once '../controller/notificationEtudController.php';
            $notificationEtudController = new notificationEtudController();
            $idNiveau = $_SESSION['etd']['IdNiveau'];
            $notification = $notificationEtudController->getNotificationRapportByNiveau($idNiveau);
            $_SESSION['notification'] = $notification;
            $log->createAction($_SESSION['etd']['CNE'],'info','etd: est allé a "notification"', $_SESSION['etd']['IdCompte']);
            header('location: ../views/etudiant/consulterNotification.php');
            exit();
            break;
            
        case 'actualite':
            if($_GET['role'] == 0 ){
                
                header('location: ../views/admin/interface_admin.php');
                exit();
                break;

            }
            elseif($_GET['role'] == 1 ){
        
                header('location: ../views/prof/interface_prof.php');
                exit();
                break;
            }
            if($_GET['role'] == 2 ){
                
                header('location: ../views/etudiant/interface_Etudiant.php');
                exit();
                break;
            }      
            
        case 'tracker': 

            require_once '../controller/logController.php';
            $logs = new loginController();
    
            $res = $logs->getAllLogins();

           $_SESSION['logins'] = $res;
           
           header('location: ../views/admin/tracker_users.php');

           exit();
           break;

        case 'todolist':
            require_once '../controller/todolistController.php';
            $todolistController=new todolistController();
            $idprof=$_SESSION['prof']['IdProf'];
            $todo=$todolistController->fetch_todo($idprof);
            $_SESSION['todo']=$todo;
            $log->createAction($_SESSION['prof']['CIN'],'info','prof: est allé à "to do list" ', $_SESSION['prof']['IdCompte']);
            header('location: ../views/prof/todolist.php');
            exit();
            break;

        case 'compte':
            if($_GET['role'] == 0 ){
                $log->createAction($_SESSION['admin']['CIN'],'info','admin: est allé à "Compte" ', $_SESSION['admin']['IdCompte']);
                header('location: ../views/admin/afficher_info.php');
                exit();
                break;

            }
            elseif($_GET['role'] == 1 ){
                $log->createAction($_SESSION['prof']['CIN'],'info','prof: est allé à "Compte" ', $_SESSION['prof']['IdCompte']);
                header('location: ../views/prof/afficher_info.php');
                exit();
                break;
            }
            if($_GET['role'] == 2 ){
                $log->createAction($_SESSION['etd']['CNE'],'info','etd: est allé à "Compte" ', $_SESSION['etd']['IdCompte']);
                header('location: ../views/etudiant/afficher_info.php');
                exit();
                break;
            }

        case 'editerCompte':
            if($_GET['role'] == 0 ){
                $log->createAction($_SESSION['admin']['CIN'],'info','admin: est allé à "editer compte" ', $_SESSION['admin']['IdCompte']);
                header('location: ../views/admin/editer_compte.php');
                exit();
                break;

            }
            elseif($_GET['role'] == 1 ){
                $log->createAction($_SESSION['prof']['CIN'],'info','prof: est allé à "editer compte" ', $_SESSION['prof']['IdCompte']);
                header('location: ../views/prof/editer_compte.php');
                exit();
                break;
            }
            if($_GET['role'] == 2 ){
                $log->createAction($_SESSION['etd']['CNE'],'info','etd: est allé à "editer compte" ', $_SESSION['etd']['IdCompte']);
                header('location: ../views/etudiant/editer_compte.php');
                exit();
                break;
            } 

        case 'supprimerProf':
            require_once '../controller/addProfController.php';
            $prof = new addProfController();
            
            $res = $prof->getAllProfs();
            $_SESSION['getProf'] = $res;

            $log->createAction($_SESSION['admin']['CIN'],'info','admin: est allé à "Supprimer Prof" ', $_SESSION['admin']['IdCompte']);

            header('location: ../views/admin/supprimer_prof.php');


        default:

        break;


    } 
    
}
/////////////////////////////////////////////////////////////////////////////////
    /**
    * pour afficher chaque annonce:
    * 
    */
//////////////////////////////////////////////////////////////////////////////////
if(isset($_GET['idAnnonce'])){
    session_start();
    require "../controller/notificationEtudController.php";
    $idAnnonce = $_GET['idAnnonce'];
    $idNiveau = $_SESSION['etd']['IdNiveau'];
    $idFiliere= $_SESSION['etd']['IdFiliere'];
    $idEtudiant= $_SESSION['etd']['IdEtudiant'];
    $notificationEtudController = new notificationEtudController();
    $notification = $notificationEtudController->lireNotification($idAnnonce);
    $nameFiliere= $notificationEtudController->getFiliereName($idFiliere);
    $nameLevel= $notificationEtudController->getLevelName($idNiveau);
    $notificationEtudController->consultationAnnonce($idAnnonce,$idEtudiant);
    
    $_SESSION['notificationDetail'] = $notification;
    $_SESSION['filiere'] = $nameFiliere['Nom'];
    $_SESSION['niveau'] = $nameLevel['Nom'];

    $log->createAction($_SESSION['etd']['CNE'],'info','etd: a consulter une notification', $_SESSION['etd']['IdCompte']);
    header('location: ../views/etudiant/lireNotification.php');
   
   
}
/////////////////////////////////////////////////////////////////////////////////
   /**
    * pour afficher chaque actualite:
    * 
    */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_GET['idActualite'])){
    session_start();
    require "../controller/notificationEtudController.php";
    $idActualite = $_GET['idActualite'];
    $idEtudiant= $_SESSION['etd']['IdEtudiant'];
    $notificationEtudController = new notificationEtudController();
    $notification = $notificationEtudController->showDetailActualite($idActualite);
    $cible= $notificationEtudController->isActualitePublic($idActualite);
    $notificationEtudController->consultationAnnonce($idActualite,$idEtudiant);
    $_SESSION['actualiteDetail'] = $notification;
    $_SESSION['cible']= $cible;

    $log->createAction($_SESSION['etd']['CNE'],'info','etd: a consulter une Actualite', $_SESSION['etd']['IdCompte']);
    header('location: ../views/etudiant/lireActualite.php');
   
   
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * pour inserer le compte et etudiant
     */
/////////////////////////////////////////////////////////////////////////////////
 if(isset($_POST['ajout-etudiant'])){
    session_start();

    require '../vendor/autoload.php';
    require_once '../controller/addStudentController.php';

    $excelMimes = array('text/xls', 'text/xlsx', 'application/excel', 'application/vnd.msexcel', 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');  

    if(!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'], $excelMimes)){

        $file_tmp = $_FILES['file']['tmp_name'];
        $filiere = $_POST['filiere'];
        $niveau = $_POST['niveau'];

        
        $reader = new Xlsx;
        $spreadsheet = $reader->load($file_tmp);
        $worksheet = $spreadsheet->getActiveSheet();
        $worksheet_arr = $worksheet->toArray();


        //Validation des donnees
        $isValid=true;
        $errors = []; 
        $validData=[];

        foreach ($worksheet_arr as $rowIndex => $row) {

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


           // Validation des cases vides
            if (empty($nom) || empty($prenom) || empty($cin) || empty($cne) || empty($sexe) || empty($date) || empty($email) || empty($tel)) {
                $isValid = false;
                $errors[] = "Une case vide se trouve dans la casee : " . ($rowIndex + 1) . ".";
                continue;
            }

            $checkStudent = $addStudent->CheckStudentByCne($cne);
            if($checkStudent){
                $isValid = false;
                $errors[] = "Invalid CNE dans la case : " . ($rowIndex + 1) . ".";
                continue;
            }

            $validData[] = [
                'nom' => $nom,
                'prenom' => $prenom,
                'cin' => $cin,
                'cne' => $cne,
                'sexe' => $sexe,
                'date' => $date,
                'email' => $email,
                'tel' => $tel,
                'login' => $login,
                'mdp' => $mdp,
                'idrole' => $idrole,
                'idadmin' => $idadmin,
                'niveau' => $niveau,
                'filiere' => $filiere
            ];
        }

        if (!$isValid) {
            $_SESSION['etat_upload_erreur'] = "Une erreur est survenue lors de l'execution du fichier a cause de " . implode(', ', $errors);
            echo $_SESSION['etat_upload_erreur'];
            header('location: ../views/admin/ajout_etudiants.php');
            exit();
        }

        foreach ($validData as $data) {
            $nom = $data['nom'];
            $prenom = $data['prenom'];
            $cin = $data['cin'];
            $cne = $data['cne'];
            $sexe = $data['sexe'];
            $date = $data['date'];
            $email = $data['email'];
            $tel = $data['tel'];
            $login = $data['login'];
            $mdp = $data['mdp'];
            $idrole = $data['idrole'];
            $idadmin = $data['idadmin'];
            $niveau = $data['niveau'];
            $filiere = $data['filiere'];
        
            $addStudent->addAccount($login,$mdp);

            $idcompte = $addStudent->getAccountID($login, $mdp);
            
            $addStudent->insertStudent($nom, $prenom, $cin, $cne, $sexe, $date, $email, $tel, $idcompte, $idrole ,$login, $mdp, $idadmin, $niveau,$filiere);
        }
        $_SESSION['ajouterEtudiant'] = "les Etudiant on ete ajouter avec succes \n les comptes des etudiants on ete creer avec succes";
        $log->createAction($_SESSION['admin']['CIN'],'info','admin: a ajouter des etudiant ', $_SESSION['admin']['IdCompte']);
        
        
    }else{
        $log->createAction($_SESSION['admin']['CIN'],'error','admin: a tenter ajouter etudiant avec un fichier non excel ', $_SESSION['admin']['IdCompte']);
    }
    header('location: ../views/admin/ajout_etudiants.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /**
    * Pour ajouter les notes
    */
/////////////////////////////////////////////////////////////////////////////////
if (isset($_POST['importSubmit'])) {

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

            //Validation des donnees
            $isValid=true;
            $errors = []; 
            $validData=[];

            foreach ($worksheet_arr as $rowIndex => $row) { 
                $CNE = $row[0]; 
                $Valeur = $row[1];

                // Validation des cases vides
                if (empty($CNE) || empty($Valeur)) {
                    $isValid = false;
                    $errors[] = "Une case vide se trouve dans la casee : " . ($rowIndex + 2) . ".";
                    continue;
                }

                // Validation des fausses CNE 
                $id = $etd->get_id_etd($CNE);
                if (!$id) {
                    $isValid = false;
                    $errors[] = "Invalid CNE '$CNE' dans la ligne " . ($rowIndex + 2) . ".";
                    continue;
                }

                // Validation des notes
                if (!is_numeric($Valeur) || $Valeur < 0 || $Valeur > 20) {
                    $isValid = false;
                    $errors[] = "Invalid note '$Valeur' dans la ligne " . ($rowIndex + 2) . ". La note doit etre entre 0 et 20";
                    continue;
                }

                $validData[] = [
                    'CNE' => $CNE,
                    'Valeur' => $Valeur,
                    'idEtudiant' => $id
                ];
            }

            if (!$isValid) {
                $_SESSION['etat_note_erreur'] = "Une erreur est survenue lors de l'execution du fichier a cause de " . implode(', ', $errors);
                header('location: ../views/admin/publier_note.php');
                exit();
            }

            foreach ($validData as $data) {
                $CNE = $data['CNE'];
                $Valeur = $data['Valeur'];
                $idEtudiant = $data['idEtudiant'];
                $idModule = $_POST['module'];
                $idAdmin = $_SESSION['admin']['IdAdmin'];

                $etd->upload_note(
                    (float)$Valeur, 
                    (int)$idModule, 
                    (int)$idAdmin, 
                    (int)$idEtudiant
                );
            }

            $_SESSION['etat_note_succes'] = 'Les notes ont été ajoutées avec succès';
            $log->createAction($_SESSION['admin']['CIN'], 'info', 'admin: a publié des notes ', $_SESSION['admin']['IdCompte']);
        } else {  
            $log->createAction($_SESSION['admin']['CIN'], 'error', 'admin: erreur lors de la publication des notes ', $_SESSION['admin']['IdCompte']);
            $_SESSION['etat_note_erreur'] = 'Une erreur est survenue, contactez Mr Cherradi.';
        } 
    } else { 
        $_SESSION['etat_note_fail'] = 'Fichier invalide, format insupportable';
        $log->createAction($_SESSION['admin']['CIN'], 'error', 'admin: tenté de mettre un fichier non Excel', $_SESSION['admin']['IdCompte']);
    }

    header('location: ../views/admin/publier_note.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /**
    * FOR THE PUBLISH ANNOUNCEMENT 
    */
/////////////////////////////////////////////////////////////////////////////////
if (isset($_POST['publier_annonce'])) {

    require_once '../controller/AnnonceController.php';
    session_start();
    
    if (isset($_FILES['annonce']) && $_FILES['annonce']['error'] == 0 && ( !empty($_POST['check_list']) ) ) {

        $file_name = $_FILES['annonce']['name'];  
        $file_tmp = $_FILES['annonce']['tmp_name']; 
        $destination = "../uploads/". basename($file_name);
        $titre = $_POST['titre'];
        $descriptif = $_POST['descriptif'];

        if (move_uploaded_file($file_tmp, $destination)){
            
                
            if(!empty($_POST['check_list'])){
                
                $annonce = new AnnonceController();
                $annonce->insertAnnonce($titre, $descriptif, $file_name);
                
                foreach($_POST['check_list'] as $value){
                    $value = (int) $value;
                    
                    $annonce->insertAnnonceNiveau($file_name, $value);
                    $_SESSION['annonce_valide']="annonce a ete publier ";
                    
                }
                $log->createAction($_SESSION['admin']['CIN'],'info','admin: a publier une annonce ', $_SESSION['admin']['IdCompte']);
        
            }
            // else{
            //     $all = $_POST['toutes_filieres'];
            //     $all = (int) $all;
            //     // var_dump($all);
            //    
            //     $annonce = new AnnonceController();
            //     $annonce->insertAnnonce($titre, $descriptif,$file_name);

            //     $annonce->insertAnnonceNiveau($file_name, $all);
            
            // }
    
        }else{
            $_SESSION['annonce_invalide']="Erreur!! l'Annonce n'a pas ete publier ";
            $log->createAction($_SESSION['admin']['CIN'],'error','admin: error lors de publication d annonce ', $_SESSION['admin']['IdCompte']);
        }

    }else{
        $log->createAction($_SESSION['admin']['CIN'],'error','etd: a tenter ajouter un rapport avec un fichier non pdf ',$_SESSION['admin']['IdCompte'] );
    }
    
    header('location: ../views/admin/publier_annonce.php');
} 
/////////////////////////////////////////////////////////////////////////////////

    /**
     * pour avoir les etudiants de niveau (retrancher etd ):
     */

/////////////////////////////////////////////////////////////////////////////////
if (isset($_GET['niveau']) && isset($_GET['filiere']) && isset($_GET['idniveau'])) {
    session_start();

    $filiere = $_GET['filiere'];
    $niveau = $_GET['niveau'];
    $idniveau = $_GET['idniveau'];

    $_SESSION['rt_fil'] = $filiere;
    $_SESSION['rt_nv'] = $niveau;
    $_SESSION['rt_idnv'] = $idniveau;

    require_once "../controller/deleteStudentController.php";

    $deleteStudentController = new deleteStudentController();

    $studentByLevel = $deleteStudentController->StudentByLevel($idniveau);

    $_SESSION['studentByLevel'] = $studentByLevel;

    $log->createAction($_SESSION['admin']['CIN'],'info','admin: a chercher des etudiant pour retrancher etudiant ', $_SESSION['admin']['IdCompte']);

    header('location: ../views/admin/affichListEtud.php');
    
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * la barre de recherche (dans retrancher etd ):
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['search'])){
    session_start();

    $cin = $_POST['cin'];

    unset($_SESSION['studentByLevel']);

    require_once "../controller/deleteStudentController.php";

    $deleteStudentController = new deleteStudentController();

    $studentByCin = $deleteStudentController->getStudentByCin($cin);

    $_SESSION['studentByCin'] = $studentByCin;

    $log->createAction($_SESSION['admin']['CIN'],'info','admin: a chercher des etudiant dans retrancher etudiant  ', $_SESSION['admin']['IdCompte']);
    header('location: ../views/admin/affichListEtud.php');


}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * activer/desactiver le compte:
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST["activer"])){

    if(isset($_POST['idEtudiant'])) {

        session_start();

        $idetud = $_POST['idEtudiant'];

        require_once "../controller/deleteStudentController.php";

        $deleteStudentController = new deleteStudentController();

        try{
        $res = $deleteStudentController->activateAccount($idetud);
            $_SESSION['success-actif']='Ce compte est desactive/active avec success';
            $log->createAction($_SESSION['admin']['CIN'],'info','admin: a activer un compte', $_SESSION['admin']['IdCompte']);
        }catch(Throwable $e){
            $_SESSION['error-actif']='un erreur se produit , veuillez repeter l\'operation lterieuremnt';
            $log->createAction($_SESSION['admin']['CIN'],'error','admin: error lors activation un compte', $_SESSION['admin']['IdCompte']);
        }

        $studentByLevel = $deleteStudentController->StudentByLevel($_SESSION['rt_idnv']);

        $_SESSION['studentByLevel'] = $studentByLevel;

        header('location: ../views/admin/affichListEtud.php');
    }
}
    /**
     * desactiver
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST["desactiver"])){

    if(isset($_POST['idEtudiant'])){

        session_start();

        $idetud = $_POST['idEtudiant'];

        require_once "../controller/deleteStudentController.php";

        $deleteStudentController = new deleteStudentController();

        try{
            $deleteStudentController->desactivateAccount($idetud);
            $_SESSION['success-actif']='Ce compte est desactive/active  avec success';
            $log->createAction($_SESSION['admin']['CIN'],'info','admin: a desactiver un compte', $_SESSION['admin']['IdCompte']);
        }catch(Throwable $e){
            $_SESSION['error-actif']='un erreur se produit , veuillez repeter l\'operation lterieuremnt';
            $log->createAction($_SESSION['admin']['CIN'],'error','admin: error lors de desactivation un compte', $_SESSION['admin']['IdCompte']);
        }

        $studentByLevel = $deleteStudentController->StudentByLevel($_SESSION['rt_idnv']);

        $_SESSION['studentByLevel'] = $studentByLevel;

        header('location: ../views/admin/affichListEtud.php');
    }
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * Pour la publication de rapport de prof
     */
/////////////////////////////////////////////////////////////////////////////////
if ( isset($_POST['rapportsubmit']) ) {
    session_start();

    include '../controller/rapportController.php';
    if(!empty($_POST['textarea']) && !empty($_POST['niveau'] && !empty($_POST['module']) && !empty($_POST['date']))){

        $Descriptive = $_POST['textarea'];
        $idProf=$_SESSION['prof']['IdProf'];
        $IdNiveau =  $_POST['niveau'];
        $idModule=$_POST['module'];
        $Datelimite=$_POST['date'];

        $rapportController = new rapportController();
        $rapportController->upload_rapportprof($Descriptive,$idProf,$IdNiveau,$idModule,$Datelimite);

        $log->createAction($_SESSION['prof']['CIN'],'info','prof: a publier un Rapport ', $_SESSION['prof']['IdCompte']);
        $_SESSION['etat_rapport_succes']="Votre anonce de rapport est publie avec succes";
       
        
    }else{
        $_SESSION['etat_rapport_error'] = "svp remplir tous les champs !!";
        $log->createAction($_SESSION['prof']['CIN'],'error','prof: veut publier un rapport sans specifier les criteres', $_SESSION['prof']['IdCompte']);
    } 

    header('location: ../views/prof/rapport.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * etudiant soumis un rapport
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['rapportpublier'])){
    session_start();

    include '../controller/postrapportController.php';
    $rapport_id = $_POST['rapport_id'];
    $filename = basename($_FILES["file"]["name"]);
    $tempfile = $_FILES["file"]["tmp_name"];
    $folder = "../uploads/rapport/".$filename;

    if($_FILES["file"]["type"] == 'application/pdf'){

        if($filename == ""){
            $_SESSION['etat_rapport_fail'] = "Une erreur est survenue";
            $log->createAction($_SESSION['etd']['CNE'],'error','etd: a submiter un fichier vide dans rapport ', $_SESSION['etd']['IdCompte']);
            header('location: ../views/etudiant/postuler_rapport.php');
        }else{
            $postrapportController = new postrapportController();
            $idEtudiant = $_SESSION['etd']['IdEtudiant'];
            if ($postrapportController->studentHasSubmittedFile($rapport_id,$idEtudiant)) {

                $_SESSION['error'] = "Vous avez déjà soumis un fichier pour ce rapport.";

                $log->createAction($_SESSION['etd']['CNE'],'error','etd: tenter de submiter un rapport deux fois ', $_SESSION['etd']['IdCompte']);
                header('location: ../views/etudiant/postuler_rapport.php');
                exit();
            }
            else{
                move_uploaded_file($tempfile,$folder);

                $idEtudiant=$_SESSION['etd']['IdEtudiant'];

                $postrapportController->upload_rapportetd($rapport_id,$filename,$folder,$idEtudiant);

                $_SESSION['etat_rapport_succes'] = "Votre Rapport est publié avec succès";

                $log->createAction($_SESSION['etd']['CNE'],'info','etd: a submiter un rapport ', $_SESSION['etd']['IdCompte']);
                header('location: ../views/etudiant/postuler_rapport.php');
            } 
        }
    }else{
        $log->createAction($_SESSION['etd']['CNE'],'error','etd: a tenter ajouter un rapport avec un fichier non pdf ',$_SESSION['etd']['IdCompte'] );
    }
    header('location: ../views/etudiant/postuler_rapport.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * Consulter les rapports des etudiants par le prof
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['chercher_rapport'])){
    session_start();
    include '../controller/rapportController.php';

    if(!empty($_POST['module'])){
        $module = $_POST['module'];
        $id_prof = $_SESSION['prof']['IdProf'];

        $rapportController = new rapportController();

        $id_rapport = $rapportController->fetch_idrapport($module,$id_prof);
        $rapports = $rapportController->fetch_students($id_rapport);
        $_SESSION['rapports']=$rapports;
        $log->createAction($_SESSION['prof']['CIN'],'info','prof: a consulter les Rapports des etudiants ', $_SESSION['prof']['IdCompte']);

    }else{
        $log->createAction($_SESSION['prof']['CIN'],'error','prof: veut consulter les rapports sans specifier les criteres ', $_SESSION['prof']['IdCompte']);
    }
    header('location: ../views/prof/consulter_rapportetd.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * afficher la liste des etudiants pour faire l'abscence 
     */ 
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['get_students'])){
    require_once '../controller/absenceController.php';
    session_start();
    if(isset($_POST['niveau']) && isset($_POST['module']) && isset($_POST['seance'])){

        $niveau = $_POST['niveau'];
        $module = $_POST['module'];
        $idprof = $_SESSION['prof']['IdProf'];
        $seance = $_POST['seance'];


        $absnc = new absenceController();

            $_SESSION['abs_nv'] = $niveau;
            $_SESSION['abs_mdl'] = $module;
            $_SESSION['type_abs'] = $seance;


            $etds = $absnc->getAllStudentByNiveau($niveau);
            $_SESSION['etd_niveau'] = $etds;


            $log->createAction($_SESSION['prof']['CIN'],'info','prof: a acceder pour faire l absence ', $_SESSION['prof']['IdCompte']);
            header('location: ../views/prof/faire_absencefn.php');

    }else{
        $_SESSION['empty-fileds'] = "remplir tous les criteres!!";
        $log->createAction($_SESSION['prof']['CIN'],'error','prof: veut afficher les etudiants sans specifier les criteres ', $_SESSION['prof']['IdCompte']);
        header('location: ../views/prof/faire_absence.php');
    }
    
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * afficher la liste des etudiants pour la consultation des Absences
     */ 
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['consulteStudent'])){
    require_once '../controller/absenceController.php';
    session_start();

    if(!empty($_POST['niveau']) && !empty($_POST['module'])){

        $niveau = $_POST['niveau'];
        $module = $_POST['module'];


        $consulte = new absenceController();
       

        $_SESSION['abs_nv'] = $niveau;
        $_SESSION['abs_mdl'] = $module;
        $etds = $consulte->getStudentWithAbsence($niveau);
        $_SESSION['etd_niveau'] = $etds;
        // var_dump($etds);

        $log->createAction($_SESSION['prof']['CIN'],'info','prof: a acceder pour consulter l absence ', $_SESSION['prof']['IdCompte']);
        header('location: ../views/prof/get_studentsfn.php');
    }else{
        $log->createAction($_SESSION['prof']['CIN'],'error','prof: veut afficher les etudiants sans specifier les criteres ', $_SESSION['prof']['IdCompte']);
    }
    // header('location: ../views/prof/get_studentsfn.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * pour faire l'absence
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['faire_absence'])){
    session_start();

    require_once '../controller/absenceController.php';


    $absence = new absenceController();

    $absLevel = $_SESSION['abs_nv'];
    $absModule =  $_SESSION['abs_mdl'];
    $idprof = $_SESSION['prof']['IdProf'];

    $etd_absente = $_POST['etd_absc'];
    $type = $_SESSION['type_abs'];

    foreach($etd_absente as $etd){
        $etd = (int)$etd;
        try{
            $absence->insertAbsence($idprof,$etd,$type,$absModule);
            $log->createAction($_SESSION['prof']['CIN'],'info','prof: a fait l absence ', $_SESSION['prof']['IdCompte']);
            $_SESSION['abs_success'] = "les absence on ete bien ajouter";

        }
        catch(Throwable $e){
            $log->createAction($_SESSION['prof']['CIN'],'error','prof: error lors de l absence" ', $_SESSION['prof']['IdCompte']);
            $_SESSION['abs_error'] = "une erreur est survenu!! re-faire l'absence stp";
        }
        
    }

    header('location: ../views/prof/faire_absence.php');


}
/////////////////////////////////////////////////////////////////////////////////
    /**
     *  Publier cours pour Prof 
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST["publierCours"])){
    session_start();
    require_once '../controller/CoursController.php';
    
    $file_name = $_FILES['cours']['name'];  
    $file_tmp = $_FILES['cours']['tmp_name']; 
    $destination = "../uploads/CoursProf/". basename($file_name);

    // if($_FILES["file"]["type"] == 'application/pdf'){

        if (move_uploaded_file($file_tmp, $destination)){

            if(!empty($_POST['niveau']) && !empty($_POST['module']) && !empty($_POST['type'])){

                $IdNiveau =  $_POST['niveau'];
                $idModule = $_POST['module'];
                $type=$_POST['type'];
                $idprof = $_SESSION['prof']['IdProf'];
                $coursController = new CoursController();
                $inser=$coursController->insertcours($file_name ,$type, $idprof, $IdNiveau, $idModule);

                $log->createAction($_SESSION['prof']['CIN'],'info','prof: a publier un cour ', $_SESSION['prof']['IdCompte']);
                $_SESSION['etat_cours_success'] = "Votre Cours est publié avec succès";
                
            }else{
                $log->createAction($_SESSION['prof']['CIN'],'error','prof: veut publier les cours sans specifier les criteres ', $_SESSION['prof']['IdCompte']);
            }
        }else{
            $log->createAction($_SESSION['prof']['CIN'],'error','prof: error lors de publication de cours ', $_SESSION['prof']['IdCompte']);
        }
    // }else{
    //     $log->createAction($_SESSION['prof']['CIN'],'error','prof: a tenter ajouter un rapport avec un fichier non pdf ', $_SESSION['prof']['IdCompte'] );
    // }
    header('location: ../views/prof/publier_cours.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * avoir tous les cours pour les archiver/desarchiver 
     */ 
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['getCours'])){

    if(!empty($_POST['niveau']) && !empty($_POST['module'])){
        session_start();

        require_once '../controller/CoursController.php';


        $IdNiveau =  $_POST['niveau'];
        $idModule = $_POST['module'];
        $idprof = $_SESSION['prof']['IdProf'];

        $_SESSION['archive_niveau'] = $IdNiveau;
        $_SESSION['archive_module'] = $idModule;
        $_SESSION['archive_prof'] = $idprof;

        $coursController = new CoursController();
        $cours = $coursController->getAllCours($idprof,$IdNiveau,$idModule);

        $_SESSION['cours']= $cours;
        $log->createAction($_SESSION['prof']['CIN'],'info','prof: a afficher la liste des cours pour la gestion ', $_SESSION['prof']['IdCompte']);

        
    }else{
        $log->createAction($_SESSION['prof']['CIN'],'error','prof: veut gerer les cours sans specifier les criteres ', $_SESSION['prof']['IdCompte']);
    
    }
    header('location: ../views/prof/archiver_cours.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * pour archiver / desarchiver un cours 
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_GET['operation'])){
    session_start();

    $operation = $_GET['operation'];
    $idcour = $_GET['id'];

    require_once '../controller/CoursController.php';
    $archive = new CoursController();

    switch($operation){

        case 'archiver':

            try{
                $archive->archiverCours($idcour);
                $_SESSION['archive_success'] = "l'element a ete archiver/desarchiver avec succes";
                $log->createAction($_SESSION['prof']['CIN'],'info','prof: a archiver un cour ', $_SESSION['prof']['IdCompte']);
            }catch(Throwable $e){
                $log->createAction($_SESSION['prof']['CIN'],'error','prof: error lors de l archivage', $_SESSION['prof']['IdCompte']);
                $_SESSION['archive_error'] = "Ops erreur lors de l'operation";
            }

            $cours = $archive->getAllCours($_SESSION['archive_prof'],$_SESSION['archive_niveau'],$_SESSION['archive_module']);
            $_SESSION['cours']= $cours;

            header('location: ../views/prof/archiver_cours.php');


            exit();
            break;

        case 'desarchiver':

            
            try{
                $archive->desarchiverCours($idcour);
                $_SESSION['archive_success'] = "l'element a ete archiver/desarchiver avec succes";
                $log->createAction($_SESSION['prof']['CIN'],'info','prof: a desarchiver un cour ', $_SESSION['prof']['IdCompte']);
            }catch(Throwable $e){
                $log->createAction($_SESSION['prof']['CIN'],'error','prof: error lors de desarchivage ', $_SESSION['prof']['IdCompte']);
                $_SESSION['archive_error'] = "Ops erreur lors de l'operation";
            }

            $cours = $archive->getAllCours($_SESSION['archive_prof'],$_SESSION['archive_niveau'],$_SESSION['archive_module']);
            $_SESSION['cours']= $cours;

            header('location: ../views/prof/archiver_cours.php');

            exit();
            break;
    }
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * for the to do list
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_GET['todolist'])){
    session_start();

    $operation = $_GET['todolist'];
    $id_prof=$_SESSION['prof']['IdProf'];
    $id = $_GET['id'];

    require_once '../controller/todolistController.php';
    $todolistController = new todolistController();

    switch($operation){

        //For finishing a task
        case 'terminer':
            try{
                $todolistController->terminer($id);
            }catch(Throwable $e){
                $_SESSION['todolist_error'] = "Oops erreur lors de l'operation";
            }

            $todo = $todolistController->fetch_todo($_SESSION['prof']['IdProf']);
            $_SESSION['todo']= $todo;

            header('location: ../views/prof/todolist.php');


            exit();
            break;

        //For deleting
        case 'supprimer':
            try{
                $todolistController->delete($id);
            }catch(Throwable $e){
                $_SESSION['todolist_error'] = "Oops erreur lors de l'operation";
            }

            $todo = $todolistController->fetch_todo($_SESSION['prof']['IdProf']);
            $_SESSION['todo']= $todo;

            header('location: ../views/prof/todolist.php');


            exit();
            break;
    }
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * For adding (to do list)
    */
if(isset($_POST['action']) && $_POST['action'] === 'addtodo'){
    session_start();
    require_once '../controller/todolistController.php';
    $todolistController = new todolistController();
    $id_prof = $_SESSION['prof']['IdProf'];
    $task = $_POST['task'];
    try{
        $todolistController->add($task, $id_prof);
    }catch(Throwable $e){
        $_SESSION['todolist_error'] = "Oops erreur lors de l'operation";
    }

    $todo = $todolistController->fetch_todo($_SESSION['prof']['IdProf']);
    $_SESSION['todo'] = $todo;

    header('location: ../views/prof/todolist.php');
    exit();
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * For editing (to do list)
    */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['action']) && $_POST['action'] === 'editTask'){
    session_start();
    require_once '../controller/todolistController.php';
    $todolistController = new todolistController();
    $id = $_POST['id'];
    $task = $_POST['task'];

    try{
        $todolistController->edit($id, $task);
    }catch(Throwable $e){
    }

    $todo = $todolistController->fetch_todo($_SESSION['prof']['IdProf']);
    $_SESSION['todo'] = $todo;

    header('location: ../views/prof/todolist.php');
    exit();
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     *changer compte details (Admin) 
    */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['compteAdmin'])){
    session_start();

    require_once '../controller/CompteController.php';

    $compte = new CompteController();

    $pattern = "/^0\d{9}$/";

    $idAdmin = $_SESSION['admin']['IdAdmin'];
    $idCompte = $_SESSION['admin']['IdCompte'];  
    
    
    if(!empty($_POST['email'])) {
        if(filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
            $email = $_POST['email'];

            $admin = $compte->getAdminByIdCompte($idCompte);
            $_SESSION['admin'] = $admin;

            $compte->changeAdminInfo($email, $_SESSION['admin']['Tel'], $idAdmin);
            $log->createAction($_SESSION['admin']['CIN'],'info','admin: a changer l\'email ', $_SESSION['admin']['IdCompte']);
            $_SESSION['editer-success'] = "Votre email/numéro de téléphone a été modifié avec succès";
        }else{
            $_SESSION['email-invalide']= "format de l'email est invalide ";
        }
    }

    
    if (!empty($_POST['numero'])) {
        if(preg_match($pattern, $_POST['numero'])){
            $tel = (int) $_POST['numero'];

            $admin = $compte->getAdminByIdCompte($idCompte);
            $_SESSION['admin'] = $admin;

            $compte->changeAdminInfo($_SESSION['admin']['Email'], $tel, $idAdmin);
            $log->createAction($_SESSION['admin']['CIN'],'info','admin: a changer le numero de telephone ', $_SESSION['admin']['IdCompte']);
            $_SESSION['editer-success'] = "Votre email/numéro de téléphone a été modifié avec succès";
        }else{
            $_SESSION['tel-invalide']="format de numéro de téléphone est invalide ";
        }
    }

    
    if(isset($_POST['mdp']) && isset($_POST['mdp2']) && isset($_POST['mdp-1'])) {
        $mdp = $_POST['mdp'];
        $mdp2 = $_POST['mdp2'];
        $AncienneMdp =  $_POST['mdp-1'];
        
        if (!empty($mdp) && !empty($mdp2) && !empty($AncienneMdp)) {
            if($AncienneMdp == $_SESSION['admin']['Mdp']){
                if($mdp == $mdp2){
                    $compte->changeAdminpassword($mdp, $idAdmin);
                    $compte->changeComptePassword($mdp, $idCompte);
                    $log->createAction($_SESSION['admin']['CIN'],'info','admin: a changer mot de passe ', $_SESSION['admin']['IdCompte']);
                    $_SESSION['mdp-success'] = "Votre mot de passe a été changé avec succès";
                } else {
                    $_SESSION['mdp-non-identique'] = "Les deux mots de passe ne sont pas identiques";
                }
            } else {
                $_SESSION['ancienn-mdp-invalide'] = "L'ancien mot de passe n'est pas correct";
            }
        }
    }

    
    $admin = $compte->getAdminByIdCompte($idCompte);
    $_SESSION['admin'] = $admin;

    
    header('location: ../views/admin/editer_compte.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * changer compte details (prof)
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['compteProf'])){
    session_start();

    require_once '../controller/CompteController.php';

    $compte = new CompteController();

    $pattern = "/^0\d{9}$/";

    $idProf = $_SESSION['prof']['IdProf'];
    $idCompte = $_SESSION['prof']['IdCompte'];  
    
    
    if(!empty($_POST['email'])) {
        if(filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
            $email = $_POST['email'];

            $prof = $compte->getProfByIdCompte($idCompte);
            $_SESSION['prof'] = $prof;

            $compte->changeProfInfo($email, $_SESSION['prof']['Tel'], $idProf);
            $log->createAction($_SESSION['prof']['CIN'],'info','prof: a changer l\'email ', $_SESSION['prof']['IdCompte']);
            $_SESSION['editer-success'] = "Votre email/numéro de téléphone a été modifié avec succès";
        }else{
            $_SESSION['email-invalide']= "format de l'email est invalide ";
        }
    }

    
    if (!empty($_POST['numero'])) {
        if(preg_match($pattern, $_POST['numero'])){
            $tel = (int) $_POST['numero'];

            $prof = $compte->getProfByIdCompte($idCompte);
            $_SESSION['prof'] = $prof;

            $compte->changeProfInfo($_SESSION['prof']['Email'], $tel, $idProf);
            $log->createAction($_SESSION['prof']['CIN'],'info','prof: a changer le numero de telephone ', $_SESSION['prof']['IdCompte']);
            $_SESSION['editer-success'] = "Votre email/numéro de téléphone a été modifié avec succès";
        }else{
            $_SESSION['tel-invalide']="format de numéro de téléphone est invalide ";
        }
    }

    
    if(isset($_POST['mdp']) && isset($_POST['mdp2']) && isset($_POST['mdp-1'])) {

        $mdp = $_POST['mdp'];
        $mdp2 = $_POST['mdp2'];
        $AncienneMdp =  $_POST['mdp-1'];
        
        if (!empty($mdp) && !empty($mdp2) && !empty($AncienneMdp)) {
            if($AncienneMdp == $_SESSION['prof']['Mdp']){
                if($mdp == $mdp2){
                    $compte->changeProfpassword($mdp, $idProf);
                    $compte->changeComptePassword($mdp, $idCompte);
                    $log->createAction($_SESSION['prof']['CIN'],'info','prof: a changer mot de passe', $_SESSION['prof']['IdCompte']);
                    $_SESSION['mdp-success'] = "Votre mot de passe a été changé avec succès";
                } else {
                    $_SESSION['mdp-non-identique'] = "Les deux mots de passe ne sont pas identiques";
                }
            } else {
                $_SESSION['ancienn-mdp-invalide'] = "L'ancien mot de passe n'est pas correct";
            }
        }
    }

    
    $prof = $compte->getProfByIdCompte($idCompte);
    $_SESSION['prof'] = $prof;

    
    header('location: ../views/prof/editer_compte.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /* *
     * changer compte details (etudiant)
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['compteEtudiant'])){
    session_start();

    require_once '../controller/CompteController.php';

    $compte = new CompteController();

    $pattern = "/^0\d{9}$/";

    $idEtud = $_SESSION['etd']['IdEtudiant'];
    $idCompte = $_SESSION['etd']['IdCompte'];  
    
    
    if(!empty($_POST['email'])) {
        if(filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
            $email = $_POST['email'];

            $etd = $compte->getEtudiantByIdCompte($idCompte);
            $_SESSION['etd'] = $etd;

            $compte->changeEtudiantInfo($email, $_SESSION['etd']['Tel'], $idEtud);
            $log->createAction($_SESSION['etd']['CNE'],'info','etd: a changer l\'email ', $_SESSION['etd']['IdCompte']);
            $_SESSION['editer-success'] = "Votre email/numéro de téléphone a été modifié avec succès";
        }else{
            $_SESSION['email-invalide']= "format de l'email est invalide ";
        }
    }

    
    if (!empty($_POST['numero'])) {
        if(preg_match($pattern, $_POST['numero'])){
            $tel = (int) $_POST['numero'];

            $etd = $compte->getEtudiantByIdCompte($idCompte);
            $_SESSION['etd'] = $etd;

            $compte->changeEtudiantInfo($_SESSION['etd']['Email'], $tel, $idEtud);
            $log->createAction($_SESSION['etd']['CNE'],'info','etd: a changer le numero de telephone ', $_SESSION['etd']['IdCompte']);
            $_SESSION['editer-success'] = "Votre email/numéro de téléphone a été modifié avec succès";
        }else{
            $_SESSION['tel-invalide']="format de numéro de téléphone est invalide ";
        }
    }

    
    if(isset($_POST['mdp']) && isset($_POST['mdp2']) && isset($_POST['mdp-1'])) {

        $mdp = $_POST['mdp'];
        $mdp2 = $_POST['mdp2'];
        $AncienneMdp =  $_POST['mdp-1'];
        
        if (!empty($mdp) && !empty($mdp2) && !empty($AncienneMdp)) {
            if($AncienneMdp == $_SESSION['etd']['Mdp']){
                if($mdp == $mdp2){
                    $compte->changeEtudiantpassword($mdp, $idEtud);
                    $compte->changeComptePassword($mdp, $idCompte);
                    $log->createAction($_SESSION['etd']['CNE'],'info','etd: a changer mot de passe', $_SESSION['etd']['IdCompte']);
                    $_SESSION['mdp-success'] = "Votre mot de passe a été changé avec succès";
                } else {
                    $_SESSION['mdp-non-identique'] = "Les deux mots de passe ne sont pas identiques";
                }
            } else {
                $_SESSION['ancienn-mdp-invalide'] = "L'ancien mot de passe n'est pas correct";
            }
        }
    }

    
    $etd = $compte->getEtudiantByIdCompte($idCompte);
    $_SESSION['etd'] = $etd;

    
    header('location: ../views/etudiant/editer_compte.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * to search logs of a user
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['searchUser'])){

    session_start();
    require_once '../controller/logController.php';

    $logs = new loginController();

    if(!empty($_POST['track'])){
        $user = $_POST['track'];
        

        try{
        $journalOfUser = $logs->getLogsBycne($user);
        $_SESSION['journal_of_user'] = $journalOfUser;
        $_SESSION['journal-error'] = "erreur lors de la recherche";
        // var_dump($_SESSION['journal_of_user']);
        $log->createAction($_SESSION['admin']['CIN'],'info','admin: a chercher les logs d\'un utilisateur ', $_SESSION['admin']['IdCompte']);

        }catch(Throwable $e){
            $_SESSION['journal-error'] = "erreur lors de la recherche";
        }

    }else{
        unset($_SESSION['journal_of_user']);
    }
    header('location: ../views/admin/tracker_users.php');
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * to add a prof
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_POST['AjouterProf'])){
    session_start();
    require_once '../controller/addProfController.php';
    $prof = new addProfController();
    $prof->addProf();
}
/////////////////////////////////////////////////////////////////////////////////
    /**
     * to desactivate/activate Prof
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_GET['Prof'])){
    session_start();
    require_once '../controller/addProfController.php';
    $prof = new addProfController();

    $idprof = (int)$_GET['id'];
    $idcompte = (int)$_GET['compte'];

    $action = $_GET['Prof'];

    
    if($action == 'activer'){

        try{
            $prof->activerProf($idprof, $idcompte);
            $log->createAction($_SESSION['admin']['CIN'],'info','admin: a activer le compte d\'un prof ', $_SESSION['admin']['IdCompte']);
            $_SESSION['success-actif'] = "Le compte a ete activer/desactiver avec success";
        }catch(Throwable $e){
            $_SESSION['error-actif'] = "Erreur lors de l'operation";
        }
    }

    elseif($action == 'desactiver'){
        try{
            $prof->desactiverProf($idprof, $idcompte);
            $log->createAction($_SESSION['admin']['CIN'],'info','admin: a desactiver le compte d\'un prof ', $_SESSION['admin']['IdCompte']);
            $_SESSION['success-actif'] = "Le compte a ete activer/desactiver avec success";
        }catch(Throwable $e){
            $_SESSION['error-actif'] = "Erreur lors de l'operation";
        }
    }

    $res = $prof->getAllProfs();
    $_SESSION['getProf'] = $res;

    header('location: ../views/admin/supprimer_prof.php');
}

/////////////////////////////////////////////////////////////////////////////////
    /**
     * to justify/delete absence
     */
/////////////////////////////////////////////////////////////////////////////////
if(isset($_GET['absence'])){
    session_start();
    require_once '../controller/absenceController.php';
    $absence = new absenceController();
    

    $action = $_GET['absence'];
    $idabsence = $_GET['id'];

    $niveau = $_GET['niveau'];

    if($action == 'supprimer'){
        try{
            $absence->deleteAbsence($idabsence);
            $_SESSION['supprimer-success'] = "l'absence a ete supprimer avec success";
            $log->createAction($_SESSION['prof']['CIN'],'info','prof: a supprimer un absence ', $_SESSION['prof']['IdCompte']);
        }catch(Throwable $e){
            $_SESSION['error-absence'] = "erreur lors de l'operation";
        }

    }

    if($action == 'justifier'){
        try{
            $absence->justifyAbsence($idabsence);
            $_SESSION['justifier-success'] = "l'absence a ete justifier avec success";
            $log->createAction($_SESSION['prof']['CIN'],'info','prof: a justifier un absence ', $_SESSION['prof']['IdCompte']);
        }catch(Throwable $e){
            $_SESSION['error-absence'] = "erreur lors de l'operation";
        }

    }

    $etds = $absence->getStudentWithAbsence($niveau);
    $_SESSION['etd_niveau'] = $etds;


    header('location: ../views/prof/get_studentsfn.php');
}


?>