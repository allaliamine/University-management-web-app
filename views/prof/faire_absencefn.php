<?php
session_start();
require_once '../../securiteprof.php';
require_once '../../includes/sidebar_prof.php';

$etudiants = $_SESSION['etd_niveau'];



?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faire Absence</title>
    <link rel="stylesheet" href="./style_Prf.css">
</head>
<body>

    <div class="card col-xl-8 offset-3 mt-5 overflow-scroll">
        <div class="card-header">Formulaire d'absence (<?=date("Y-m-d");?>)</div>
        <div class="card-body">
            <form action="../../routing/routing.php" method="post" class="form">
                
                <div class="form-group mb-4">
                    <table class="table table-hover">

                        <thead>
                            <tr>
                                <th>absence ?</th>
                                <th>Nom</th>
                                <th>Prenom</th>
                                <th>CNE</th>
                            </tr>
                        </thead>

                        <tbody>
                            <?php foreach ($etudiants as $etd){ ?> 
                            <tr>
                                <td> <input class="form-check-input" type="checkbox" value=" <?= $etd['IdEtudiant']; ?> " id="flexCheckDefault" name="etd_absc[]"> </td>
                                <td><?= $etd['Nom']; ?></td>
                                <td><?= $etd['Prenom']; ?></td>
                                <td><?= $etd['CNE']; ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>

                
                <input type="submit" name="faire_absence" id="bouton" class="btn btn-primary" value="Faire Absence">

            </form>
            
        </div>
    </div>
    
</body>
</html>