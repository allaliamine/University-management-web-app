<?php
session_start();

include '../../includes/sidebar_admin.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publier Notes</title>
    <link rel="stylesheet" href="style_admin.css">
</head>
<body>

<div class="card col-xl-8 offset-3 mt-5">
    <div class="card-header">Formulaire d'ajout des profs</div>
    <div class="card-body">

        <p class="text-success">Veuillez saisir toutes les critères de l'ajout</p>

        <form action="../../routing/routing.php" method="post" class="form">

            <div class="form-group mb-4">
                <label>Nom</label>
                <input type="text" name="NomProf" class="form-control h-25" required>
            </div>

            <div class="form-group mb-4">
                <label>Prenom</label>
                <input type="text" name="PrenomProf" class="form-control h-25" required>
            </div>

            <div class="form-group mb-4">
                <label>CIN</label>
                <input type="text" name="CinProf" class="form-control h-25" required>
            </div>

            <div class="form-group mb-4">
                <label>Email</label>
                <input type="text" name="emailProf" class="form-control h-25" required>
            </div>

            <div class="form-group mb-4">
                <label>Numero de telephone</label>
                <input type="tel" name="NumProf" class="form-control h-25" required>
            </div>

            <input type="submit" name="AjouterProf" class="btn btn-success" id="bouton" value="Ajouter" onclick="return confirm('Vous etes sure effectuer cette operation ?')">
        </form>

        <?php if(isset($_SESSION['invalide-info'])) {?>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['invalide-info'];?>
                </div>
            </div>
            <?php unset($_SESSION['invalide-info']); ?>
        <?php } ?>

        <?php if(isset($_SESSION['emty-info'])) {?>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['emty-info'];?>
                </div>
            </div>
            <?php unset($_SESSION['emty-info']); ?>
        <?php } ?>

        <?php if(isset($_SESSION['already-exist'])) {?>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['already-exist'];?>
                </div>
            </div>
            <?php unset($_SESSION['already-exist']); ?>
        <?php } ?>

        <?php if(isset($_SESSION['insert-error'])) {?>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['insert-error'];?>
                </div>
            </div>
            <?php unset($_SESSION['insert-error']); ?>
        <?php } ?>

        <?php if(isset($_SESSION['insert-success'])) {?>
            <div class="alert alert-success d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['insert-success'];?>
                </div>
            </div>
            <?php unset($_SESSION['insert-success']); ?>
        <?php } ?>


    </div>
</div>

</body>
</html>
