<?php
session_start();
require_once '../../securite.php';
include '../../includes/sidebar_etd.php';


if(isset($_SESSION['actualiteDetail'])) {
    $res= $_SESSION['actualiteDetail'];
    $cible = $_SESSION['cible'];
    $nbr=count($cible);
($cible);
    
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
      <?php if($nbr >1){?>
        <div class="card-header">Avis aux eleves ingenieurs de ENSAH: </div>
        <?php } else{?>

        <div class="card-header">Avis aux eleves ingenieurs: <?php echo $res[0]['NomNiveau'] ?>  du la filiere: <?php  echo $res[0]['nomFiliere']?>  </div><?php } ?>
        <div class="card-body">
        <div>  Une nouvelle actualite est publie sur le tableau d'actualite: </div>
        
                            
                            <?php $path="../../uploads/".$res[0]['Titre'];
                            ?>
                            <a href="<?= $path; ?>" download>Download Here</a>
                            <div>publie le : <?php echo $res[0]['date']?> </div>
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
            

