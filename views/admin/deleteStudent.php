<?php

session_start();
require_once "../../includes/sidebar_admin.php";
require_once '../../securiteadmin.php';
if(isset($_SESSION['FieldLevel'])){
    $res= $_SESSION['FieldLevel'];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retrancher Etudiant</title>
    <link rel="stylesheet" href="../admin/style_admin.css">
</head>

<body>
    <div class="card col-xl-8 offset-3 mt-5">
        <div class="card-header">Retrancher des étudiants</div>
        <div class="card-body">
            

           <?php  $rowCount = count($res); ?>

           <?php if ($rowCount > 0) { ?>

                <p class='text-success mb-4'>Veuillez choisir le Niveau correspond : </p>

                <?= $currentFiliere = null; ?>

                <?php foreach($res as $data) { ?>

                    <?php if ($data['NomFiliere'] != $currentFiliere) { ?>

                       <?php if ($currentFiliere !== null) { ?>

                            </ul> 

                        <?php } ?>

                        <p class='text-secondary mb-4'>Filière : " <?=$data['NomFiliere'];?> "</p>
                        <ul> 
                       <?= $currentFiliere = $data['NomFiliere']; ?>
                   <?php } ?>
                    <li><a href='../../routing/routing.php?filiere=" . <?= urlencode($data['NomFiliere']) . "&niveau=" . urlencode($data['NomNiveau']) .  "&idniveau=" . urlencode($data['IdNiveau']) ?>"'> <?= $data['NomNiveau'] ?> </a></li>    
                <?php } ?>
                </ul> <?php } ?>
        </div>
    </div>
</body>
</html>
            
