<?php
session_start();
include '../../includes/sidebar_prof.php';

$rapports=$_SESSION['rapports'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style_Prf.css">
    <title>Consulter Rapport</title>
</head>
<body>
    <div class="card col-xl-8 offset-3 mt-5">
        <div class="card-header">Les rapports des etudiants sont les suivants : </div>
        <div class="card-body">
            <?php foreach ($rapports as $rapport) { ?>
                <?php foreach ($rapport as $rp) { ?>
                    <div class="row mb-3">
                        <div class="card-group">
                            <div class="card">
                                <div class="card-body text-center">
                                <h5>Rapport ID:</h5>
                                <h6 class="card-text"><?= $rp['IdRapport']; ?></h6>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body text-center">
                                <h5>Descriptive :</h5>
                                <h6 class="card-text"><?= $rp['Descriptive']; ?></h6>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body text-center">
                                <h5>Nom: </h5>
                                <p class="card-text"><?= $rp['Nom']; ?></p>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body text-center">
                                <h5>Prenom: </h5>
                                <p class="card-text"><?= $rp['Prenom']; ?></p>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body text-center">
                                <h5>Rapport: </h5>
                                <?php $path="../".$rp['pdf_path'];
                                ?>
                                <a href="<?= $path; ?>" download>Download Here</a>
                                </div>
                            </div>
                            </div>
                    </div>
                <?php } ?>
            <?php } ?>
        </div>
    </div>
</body>
</html>