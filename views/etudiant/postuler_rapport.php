<?php

session_start();
include '../../includes/sidebar_etd.php';

$rapports=$_SESSION['toutrapport'];
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Postuler Rapport</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style_Etudiant.css">
</head>
<body>

    <?php if( isset($_SESSION['etat_rapport_succes']) ||  isset($_SESSION['etat_rapport_fail']) || isset($_SESSION['error'])) { ?>
    <div class="card col-xl-8 offset-3 mt-5" style="height: 10px;">

        <?php if(isset($_SESSION['etat_rapport_succes'])) {?>
            <div class="alert alert-success d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['etat_rapport_succes'];?>
                </div>
            </div>
            <?php unset($_SESSION['etat_rapport_succes']); ?>
        <?php } ?>

        <?php if(isset($_SESSION['etat_rapport_fail'])) {?>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['etat_rapport_fail'];?>
                </div>
            </div>
            <?php unset($_SESSION['etat_rapport_fail']); ?>
        <?php } ?>
        <?php if(isset($_SESSION['error'])) {?>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['error'];?>
                </div>
            </div>
            <?php unset($_SESSION['error']); ?>
        <?php } ?>
    </div>
    <?php } ?>
    <div class="container mt-5" >
        <div class="row">
            <div class="col-xl-10 offset-2">
                <div class="card mt-5">
                    <div class="card-header">Les Annonces de Rapport : </div>
                    <div class="card-body">
                        <?php
                        if ($rapports) {
                            foreach ($rapports as $rapport) {
                                ?>
                                <div class="card mb-3 overflow-scroll">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-6 col-md-2">
                                                <h5 class="card-title">Description:</h5>
                                                <p><?php echo $rapport['Descriptive']; ?></p>
                                            </div>
                                            <div class="col-sm-6 col-md-2">
                                                <h5 class="card-title">Professor:</h5>
                                                <p><?php echo $rapport['Nom']; ?></p>
                                            </div>
                                            <div class="col-sm-6 col-md-2">
                                                <h5 class="card-title">Module:</h5>
                                                <p><?php echo $rapport['Intitule']; ?></p>
                                            </div>
                                            <div class="col-sm-6 col-md-2">
                                                <h5 class="card-title">Deadline:</h5>
                                                <p><?php echo $rapport['Deadline']; ?></p>
                                            </div>
                                            <div class="col-sm-6 col-md-3">
                                                <form action="../../routing/routing.php" method="post" enctype="multipart/form-data">
                                                <input type="hidden" name="rapport_id" value="<?php echo $rapport['IdRapport']; ?>">
                                                <div class="form-group">
                                                    <label class="form-label">Choisir un fichier :</label>
                                                    <input type="file" accept=".pdf" name="file" class="form-control-file" required>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <input type="submit" name="rapportpublier" class="btn btn-success" id="bouton" value="Postuler" onclick="return confirm('Vous êtes sûr(e) d\'effectuer cette opération ?')">
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <?php
                            }
                        } else {
                            echo "<p>No reports found.</p>";
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
