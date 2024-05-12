<?php
session_start();
require_once '../../securite.php';
include '../../includes/sidebar_prof.php';


$levels = $_SESSION['levels'];
$modules = $_SESSION['modules'];

// var_dump($_SESSION['prof']);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publier Cours </title>
    <link rel="stylesheet" href="style_prf.css">
</head>
<body>
    
    <div class="card col-xl-8 offset-3 mt-5">

        <div class="card-header"> Modificaton des Cours :</div>

        <div class="card-body">
            <p class="text-primary text-success">Veuillez saisir toutes les critères pour la modifcation</p>

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
            
                <input type="submit"  name="getCours" class="btn btn-success" id="bouton" value="Acceder au Cours">

            </form>
        </div>


    </div>

    <script>
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






























































