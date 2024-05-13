<?php

use PhpOffice\PhpSpreadsheet\Reader\Xlsx;

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
        $authController->login($login, $password);

    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
 
}


/**
 * redirection est recuperation des donnees pour les champs de sidebar(etd, prf, admin)
 */
if(isset($_GET['action'])){

    session_start();

    $action = $_GET['action'];
    require_once '../controller/logController.php';

    $log = new loginController();

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

            echo $levels;
            echo $modules;

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
            echo $idetudiant;
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

            echo $module;

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
                echo $idmodule;
                $etu_cours = $coursController->getCoursForStudent($idmodule);
                $_SESSION['etu_cours'] = $etu_cours;
                $log->createAction($_SESSION['etd']['CNE'],'info','etd: est allé consulter les cours de module ', $_SESSION['etd']['IdCompte']);

                header('location: ../views/etudiant/consulter_coursfn.php');
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

    if(!empty($_FILES['file_etudiant']['name']) && in_array($_FILES['file']['type'], $excelMimes)){

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
                $log->createAction($_SESSION['admin']['CIN'],'info','admin: a ajouter des etudiant ', $_SESSION['admin']['IdCompte']);
            }
        }
    }else{
        $log->createAction($_SESSION['admin']['CIN'],'error','admin: a tenter ajouter etudiant avec un fichier non excel ', $_SESSION['admin']['IdCompte']);
    }

    header('location: ../views/admin/ajout_etudiants.php');


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
            $log->createAction($_SESSION['admin']['CIN'],'info','admin: a publier des notes ', $_SESSION['admin']['IdCompte']);
            
        }else{  
            $log->createAction($_SESSION['admin']['CIN'],'error','admin: error lors de publication des notes ', $_SESSION['admin']['IdCompte']);
            $_SESSION['etat_note_erreur']='Un erreur est survenue contactez Mr Cherradi';
        } 
    }else{ 
        $_SESSION['etat_note_fail']='Fichier unvalide, format insuportable';
        $log->createAction($_SESSION['admin']['CIN'],'error','admin: tenter de mettre un fichier non excel', $_SESSION['admin']['IdCompte']);
    } 

    header('location: ../views/admin/publier_note.php');
} 
 



/** FOR THE PUBLISH ANNOUNCEMENT */

if (isset($_POST['publier_annonce'])) {

    require_once '../controller/AnnonceController.php';
    session_start();
    

    if (isset($_FILES['annonce']) && $_FILES['annonce']['error'] == 0) {

      

            $file_name = $_FILES['annonce']['name'];  
            $file_tmp = $_FILES['annonce']['tmp_name']; 
            $destination = "../uploads/". basename($file_name);

            if (move_uploaded_file($file_tmp, $destination)){
                    
                if(!empty($_POST['check_list'])){

                    $annonce = new AnnonceController();
                    $annonce->insertAnnonce($file_name);

                    foreach($_POST['check_list'] as $value){

                        $value = (int) $value;
                        $annonce ->insertAnnonceNiveau($file_name, $value);

                        $_SESSION['annonce_valide']="annonce a ete publier ";
                        
                    }
                    $log->createAction($_SESSION['admin']['CIN'],'info','admin: a publier une annonce ', $_SESSION['admin']['IdCompte']);
            
                }
    
            }else{
                $_SESSION['annonce_invalide']="Erreur!! l'Annonce n'a pas ete publier ";
                $log->createAction($_SESSION['admin']['CIN'],'error','admin: error lors de publication d annonce ', $_SESSION['admin']['IdCompte']);

            }
        // }else{
        //     $log->createAction($_SESSION['admin']['CIN'],'error','etd: a tenter ajouter un rapport avec un fichier non pdf ',$_SESSION['admin']['IdCompte'] );
        // }
    }
    header('location: ../views/admin/publier_annonce.php');
}

/**
 * pour avoir les etudiants de niveau (retrancher etd ):
 */

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


/**
 * la barre de recherche (dans retrancher etd ):
 */
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

/**
 * activer/desactiver le compte:
 */
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
        }catch(PDOException){
            $_SESSION['error-actif']='un erreur se produit , veuillez repeter l\'operation lterieuremnt';
            $log->createAction($_SESSION['admin']['CIN'],'error','admin: error lors activation un compte', $_SESSION['admin']['IdCompte']);
        }

        $studentByLevel = $deleteStudentController->StudentByLevel($_SESSION['rt_idnv']);

        $_SESSION['studentByLevel'] = $studentByLevel;

        header('location: ../views/admin/affichListEtud.php');
    }
}

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
        }catch(PDOException){
            $_SESSION['error-actif']='un erreur se produit , veuillez repeter l\'operation lterieuremnt';
            $log->createAction($_SESSION['admin']['CIN'],'error','admin: error lors de desactivation un compte', $_SESSION['admin']['IdCompte']);
        }

        $studentByLevel = $deleteStudentController->StudentByLevel($_SESSION['rt_idnv']);

        $_SESSION['studentByLevel'] = $studentByLevel;

        header('location: ../views/admin/affichListEtud.php');
    }
}



//Pour la publication de rapport de prof

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
        $log->createAction($_SESSION['prof']['CIN'],'error','prof: veut publier un rapport sans specifier les criteres', $_SESSION['prof']['IdCompte']);
    } 

    header('location: ../views/prof/rapport.php');
}




//Publier soumettre le rapport d'etudiant


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

//Consulter les rapports des etudiants par le prof

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

//afficher la liste des etudiants pour faire l'abscence 

if(isset($_POST['get_students'])){
    require_once '../controller/absenceController.php';
    session_start();
    if(!empty($_POST['niveau']) && !empty($_POST['module'])){

        $niveau = $_POST['niveau'];
        $module = $_POST['module'];
        $idprof = $_SESSION['prof']['IdProf'];

        $absnc = new absenceController();
        $isDone = $absnc->isAbsenceAlreadyDone($idprof,$module);

        if(!$isDone){

            $_SESSION['abs_nv'] = $niveau;
            $_SESSION['abs_mdl'] = $module;

            $etds = $absnc->getAllStudentByNiveau($niveau);
            $_SESSION['etd_niveau'] = $etds;

            // var_dump($etds);

            $log->createAction($_SESSION['prof']['CIN'],'info','prof: a acceder pour faire l absence ', $_SESSION['prof']['IdCompte']);
            
        }else{
            $log->createAction($_SESSION['prof']['CIN'],'error','prof: exceder l absence de jour  ', $_SESSION['prof']['IdCompte']);
            $_SESSION['abs_done_already'] = "l'absence est deja fait pour ce module aujourdui! a Demain";
        
        }
    }else{
        $log->createAction($_SESSION['prof']['CIN'],'error','prof: veut afficher les etudiants sans specifier les criteres ', $_SESSION['prof']['IdCompte']);
    }
    header('location: ../views/prof/faire_absencefn.php');
}


//afficher la liste des etudiants pour la consultation (prof)

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
    header('location: ../views/prof/get_studentsfn.php');
}



/*pour faire l'absence*/
if(isset($_POST['faire_absence'])){
    session_start();

    require_once '../controller/absenceController.php';


    $absence = new absenceController();

    $absLevel = $_SESSION['abs_nv'];
    $absModule =  $_SESSION['abs_mdl'];
    $idprof = $_SESSION['prof']['IdProf'];

    $etd_absente = $_POST['etd_absc'];
    echo $absLevel;

    foreach($etd_absente as $etd){
        $etd = (int)$etd;

        try{
            $absence->insertAbsence($idprof,$etd,$absModule);
            $log->createAction($_SESSION['prof']['CIN'],'info','prof: a fait l absence ', $_SESSION['prof']['IdCompte']);
            $_SESSION['abs_success'] = "les absence on ete bien ajouter";

        }
        catch(PDOException $e){
            $log->createAction($_SESSION['prof']['CIN'],'error','prof: error lors de l absence" ', $_SESSION['prof']['IdCompte']);
            $_SESSION['abs_error'] = "une erreur est survenu!! re-faire l'absence stp";
        }
        
    }

    header('location: ../views/prof/faire_absence.php');


}

/**
 *  Publier cours pour Prof 
 */

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



/* avoir tous les cours pour les archiver/desarchiver */
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



/* pour archiver / desarchiver un cours */
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
            }catch(PDOException){
                $log->createAction($_SESSION['prof']['CIN'],'error','prof: error lors de l archivage', $_SESSION['prof']['IdCompte']);
                $_SESSION['archive_error'] = "Ops erreur lors de l'operation";
            }

            $cours = $archive->getAllCours($_SESSION['archive_prof'],$_SESSION['archive_niveau'],$_SESSION['archive_module']);
            $_SESSION['cours']= $cours;

            header('location: ../views/prof/archiver_cours.php');


            exit();
            break;

        case 'desarchiver':

            echo "desar";
            try{
                $archive->desarchiverCours($idcour);
                $_SESSION['archive_success'] = "l'element a ete archiver/desarchiver avec succes";
                $log->createAction($_SESSION['prof']['CIN'],'info','prof: a desarchiver un cour ', $_SESSION['prof']['IdCompte']);
            }catch(PDOException){
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
     
 


?>

