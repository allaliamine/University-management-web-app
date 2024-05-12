<?php
session_start();
require_once '../../securite.php';
include '../../includes/sidebar_prof.php';

$levels = $_SESSION['levels'];
$modules = $_SESSION['modules'];
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
        <div class="card-header">Consulter les rapports : </div>
        <div class="card-body">
            <p class="text-primary">Veuillez saisir toutes les critères pour consulter les rapports</p>
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
                <br>
                <input type="submit" name="chercher_rapport" class="btn btn-success" id="bouton" value="Chercher">
            </form>
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
    </script>

</body>
</html>