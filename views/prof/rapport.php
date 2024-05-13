<?php
session_start();
require_once '../../securiteprof.php';
include '../../includes/sidebar_prof.php';

$levels = $_SESSION['levels'];
$modules = $_SESSION['modules'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style_Prf.css">
</head>
<body>

<div class="card col-xl-8 offset-3 mt-5">
    <div class="card-header">formulaire de Publication d'annonce de postulation de Rapport</div>
    <div class="card-body">

        <p class="text-primary">Veuillez saisir toutes les critères de la publication</p>

        <form action="../../routing/routing.php" method="post" class="form" enctype="multipart/form-data">

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
                <label>Module</label>
                <select name="module" id="module" class="form-control" required>
                    <option value=""></option>
                </select>
            </div>


            <div class="form-group mb-4">
                <label class="form-label">Entrer le Descriptive de la publication : </label>
                <br>
                <textarea name="textarea" class="textarea" placeholder="ECRIVEZ ICI" required></textarea>
            </div>

            <div class="form-group mb-4s">
                <label class="form-label">Entrer la date limite d'acceptation des rapports : </label>
                <input type="date" name="date" id="datemin" class="form-control" required>
            </div>

            <br>
            <input type="submit" name="rapportsubmit" class="btn btn-success" id="bouton" value="publier" onclick="return confirm('Vous etes sure effectuer cette operation ?')">

        </form>

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

    </div>
</div>

<script>
    //Javascript show modules based on niveau
    document.addEventListener("DOMContentLoaded", function() {
        var niveauSelect = document.getElementById('niveau');
        var moduleSelect = document.getElementById('module');
        
        niveauSelect.addEventListener('change', function() {
            var niveauId = niveauSelect.value;
            
            // Clear previous options
            moduleSelect.innerHTML = '<option value=""></option>';
            
            // Add new options based on the selected niveau
            <?php foreach($modules as $mdl) { ?>
                if (<?= $mdl['IdNiveau']; ?> == niveauId) {
                    var option = document.createElement('option');
                    option.value = <?= $mdl['IdModule']; ?>;
                    option.textContent = '<?= $mdl['Intitule']; ?>';
                    moduleSelect.appendChild(option);
                }
            <?php } ?>
        });
    });


    //Javascript for giving the min date as the current date 
    document.addEventListener("DOMContentLoaded", function() {
        // Get the current date
        var today = new Date();
        var yyyy = today.getFullYear();
        var mm = String(today.getMonth() + 1).padStart(2, '0');
        var dd = String(today.getDate()).padStart(2, '0');
        var currentDate = yyyy + '-' + mm + '-' + dd;
        
        // Set the minimum date attribute of the input field to the current date
        document.getElementById("datemin").setAttribute("min", currentDate);
    });
    

</script>

</body>
</html>