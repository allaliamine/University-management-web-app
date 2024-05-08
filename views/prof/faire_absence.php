<?php
session_start();
include '../../includes/sidebar_prof.php';



$levels = $_SESSION['levels'] ;
$module = $_SESSION['prf_mdls'] ;
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./style_Prf.css">
</head>
<body>
    
    <div class="card col-xl-8 offset-3 mt-5">
        <div class="card-header">Formulaire d'absence</div>
        <div class="card-body">
            <p class="text-primary">Veuillez saisir toutes les critères pour faire l'abscence</p>
            <form action="../../routing/routing.php" method="post" class="form">
                
                <div class="form-group mb-4">
                    <label>Niveau</label>
                    <select name="niveau" id="niveau" class="form-control" required>
                        <option value=""></option>
                        <?php foreach($levels as $lvl) { ?>
                        <option value="<?= $lvl['IdNiveau']; ?>"><?= $lvl['Nom'];?> </option>
                        <?php } ?>
                    </select>
                </div>

                <div class="form-group mb-4">
                    <label>module</label>
                    <select name="module" id="module" class="form-control" required>
                        <option value=""></option>
                        <?php foreach($module as $mdl) { ?>
                        <option value="<?= $mdl['IdModule']; ?>"><?= $mdl['Intitule'];?> </option>
                        <?php } ?>
                    </select>
                </div>

                <input type="submit" name="get_students" id="bouton" class="btn btn-primary" value="acceder">

            </form>
            
        </div>
    </div>

        
</body>
</html>