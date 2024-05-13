<?php
session_start();
require_once '../../securite.php';
include '../../includes/sidebar_etd.php';


if(isset($_SESSION['notificationDetail'])) {
    $res= $_SESSION['notificationDetail'];
    $nameFiliere=$_SESSION['filiere'] ;
    $nameLevel=$_SESSION['niveau'] ;
   
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style_Etudiant.css">

</head>
<body>
    <div class="card col-xl-8 offset-3 mt-5">
        <div class="card-header">Avis aux eleves ingenieurs: <?php echo  $nameLevel?>  du la filiere: <?php  echo $nameFiliere?>  </div>
        <div class="card-body">
        <div> Une nouvelle actualite est publie sur le tableau d'actualite: </div>
        
                            
                            <?php $path="../../uploads/".$res['Titre'];
                            ?>
                            <a href="<?= $path; ?>" download>Download Here</a>
                            <div>publie le : <?php echo $res['date']?> </div>
                            </div>
                        </div>
                      
       
        </div>
    </div>
   <?php
} else {
 header("location: ../../public/index.php");
}
?>
</body>
</html>
            

