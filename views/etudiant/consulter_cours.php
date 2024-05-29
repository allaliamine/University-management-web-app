<?php
session_start();

include '../../includes/sidebar_etd.php';

$lvl_mdls = $_SESSION['lvl_mdls'];


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulter Cours</title>
    <link rel="stylesheet" href="./style_Etudiant.css">
</head>
<body>
    <div class="col-xl-8 offset-3">
        <div class="card mt-5">
            <div class="card-header">Les Cours : </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Module</th>
                                    <th>Professeur</th>
                                </tr>
                            </thead>

                            <tbody>
                            <?php foreach ($lvl_mdls as $mdl){ ?> 
                            <tr>
                                <td><?= $mdl['IdModule']?></td>
                                <td><a href="../../routing/routing.php?action=getAllCours&etape=2&id=<?= $mdl['IdModule'] ?>"> <?= $mdl['Intitule']; ?> </a></td>
                                <td><?php echo "Pr.".$mdl['Nom_Professeur']." ".$mdl['Prenom_Professeur']; ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>

                    </table>
                    
                </div>
            </div>
        </div>
    </div>
</body>
</html>