<?php
session_start();
include '../../includes/sidebar_etd.php';

$etu_cour = $_SESSION['etu_cours'];

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
                                <th>Type</th>
                                <th>Titre</th>
                                <th>Module</th>
                                <th>Download</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($etu_cour as $doc){ ?> 
                            <tr>
                                <td><?= $doc['IdCours']?></td>
                                <td><?= $doc['Type']?></td>
                                <td><?= $doc['Nom_Cours']; ?></td>
                                <td><?= $doc['Nom_Module']; ?></td>
                                <td>
                                    <?php $path="../../uploads/CoursProf/".$doc['Nom_Cours'];?>
                                    <a href="<?= $path; ?>" download>Download Here</a>
                                    </div>
                                </td>
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