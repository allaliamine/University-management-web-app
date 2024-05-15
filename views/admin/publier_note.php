<?php
session_start();
require_once '../../securiteadmin.php';
include '../../includes/sidebar_admin.php';

$majors = $_SESSION['majors'];
$levels = $_SESSION['levels'];
$modules = $_SESSION['modules'];

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
    <div class="card-header">Formulaire de Publication des notes</div>
    <div class="card-body">

        <p class="text-success">Veuillez saisir toutes les critères de la publication</p>

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

            <div class="form-group mb-4" id="modulesDropdown">
                <label>Module</label>
                <select name="module" id="module" class="form-control" required>
                </select>
            </div>

            <div class="form-group mb-4">
                <label class="form-label">Choisir un fichier de l'importation:</label>
                <input type="file" accept=".xlsx, .xls" name="file" class="form-control h-25" required>
            </div>

            <input type="submit" name="importSubmit" class="btn btn-success" id="bouton" value="publier" onclick="return confirm('Vous etes sure effectuer cette operation ?')">
        </form>

        <?php if(isset($_SESSION['etat_note_succes'])) {?>
            <div class="alert alert-success d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['etat_note_succes'];?>
                </div>
            </div>
            <?php unset($_SESSION['etat_note_succes']); ?>
        <?php } ?>

        <?php if(isset($_SESSION['etat_note_erreur'])) {?>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['etat_note_erreur'];?>
                </div>
            </div>
            <?php unset($_SESSION['etat_note_erreur']); ?>
        <?php } ?>

        <?php if(isset($_SESSION['etat_note_fail'])) {?>
            <div class="alert alert-warning d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['etat_note_fail'];?>
                </div>
            </div>
            <?php unset($_SESSION['etat_note_fail']); ?>
        <?php } ?>

    </div>
</div>

<script>
    // JavaScript to update levels dropdown based on selected major
    document.getElementById("filiere").addEventListener("change", function() {
        var selectedFiliereId = this.value;
        var levelsDropdown = document.getElementById("niveau");
        var levels = <?= json_encode($levels); ?>;
        var modulesDropdown = document.getElementById("module");

        // Clear existing options
        levelsDropdown.innerHTML = "<option value=''></option>";

        // Populate levels dropdown based on selected major
        levels.forEach(function(level) {
            if (level.IdFiliere == selectedFiliereId) {
                var option = document.createElement("option");
                option.value = level.IdNiveau;
                option.text = level.Nom;
                levelsDropdown.appendChild(option);
            }
        });

        // Clear modules dropdown
        modulesDropdown.innerHTML = "<option value=''></option>";
    });

    // JavaScript to update modules dropdown based on selected level
    document.getElementById("niveau").addEventListener("change", function() {
        var selectedLevelId = this.value;
        var modulesDropdown = document.getElementById("module");
        var modules = <?= json_encode($modules); ?>;

        // Clear existing options
        modulesDropdown.innerHTML = "<option value=''></option>";

        // Populate modules dropdown based on selected level
        modules.forEach(function(module) {
            if (module.IdNiveau == selectedLevelId) {
                var option = document.createElement("option");
                option.value = module.IdModule;
                option.text = module.Intitule;
                modulesDropdown.appendChild(option);
            }
        });
    });
</script>

</body>
</html>
