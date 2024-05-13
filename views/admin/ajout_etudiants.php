<?php

session_start();
require_once '../../securiteadmin.php';
include '../../includes/sidebar_admin.php';


$majors = $_SESSION['majors'];
$levels = $_SESSION['levels'];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter Etudiants</title>
    <link rel="stylesheet" href="style_admin.css">
</head>
<body>

    <div class="card col-xl-8 offset-3 mt-5">
        <div class="card-header">formulaire d'ajout des etudiants</div>
        <div class="card-body">

            <p class="text-primary">Veuillez saisir toutes les critères de l'ajout</p>

            <form action="../../routing/routing.php" method="post" class="form" enctype="multipart/form-data">
                
                <div class="form-group mb-4">
                    <label>Filiere</label>
                    <select name="filiere" id="filiere" class="form-control" required>
                        <option value=""></option>
                        <?php foreach($majors as $mjr) { ?>
                        <option value="<?= $mjr['IdFiliere']; ?>"><?= $mjr['Nom'];?> </option>
                        <?php } ?>
                    </select>
                </div>
               

                <div class="form-group mb-4" id="levelsDropdown">
                    <label>Niveau</label>
                    <select name="niveau" id="niveau" class="form-control" required>
                    </select>
                </div>


                <div class="form-group mb-4">
                    <label class="form-label" >Choisir un fichier de l'importation:</label>
                    <input type="file" accept=".xlsx, .xls" name="file_etudiant" class="form-control" required>
                </div>

                
                <input type="submit" name="ajout-etudiant" id="bouton" class="btn btn-primary" value="ajouter" onclick="return confirm('Vous etes sure effectuer cette operation ?')">
            </form>

            <?php if(isset($_SESSION['ajouterEtudiant'])) {?>
                <div class="alert alert-success d-flex align-items-center" role="alert">
                    <div>
                        <?php echo $_SESSION['ajouterEtudiant'];?>
                    </div>
                </div>
                <?php unset($_SESSION['ajouterEtudiant']); ?>
            <?php } ?>

        </div>
    </div>

    <script>
        // JavaScript to update levels dropdown based on selected major
        document.getElementById("filiere").addEventListener("change", function() {
            var selectedFiliereId = this.value;
            var levelsDropdown = document.getElementById("levelsDropdown");
            var levels = <?= json_encode($levels); ?>;

            // Clear existing options
            levelsDropdown.innerHTML = "<label>Niveau</label><select name='niveau' id='niveau' class='form-control' required><option value=''></option>";

            // Populate levels dropdown based on selected major
            levels.forEach(function(level) {
                if (level.IdFiliere == selectedFiliereId) {
                    var option = document.createElement("option");
                    option.value = level.IdNiveau;
                    option.text = level.Nom;
                    document.getElementById("niveau").appendChild(option);
                }
            });
        });
    </script>

</body>
</html>