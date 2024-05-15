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
    <title>Publier Annonce</title>
    <link rel="stylesheet" href="./style_admin.css">
</head>
<body>
    <div class="col-xl-8 offset-3 mt-5">
        <div class="card">

            <div class="card-header text-success">Publier les Annonces</div>
            <div class="card-body">

                <form action="../../routing/routing.php" method="post" class="form" enctype="multipart/form-data">

                    <div class="form-check">
                        
                        <?php foreach($majors as $mjr) { ?>
                            
                            <label><?= $mjr['Nom']; ?></label>
                        
                            <?php foreach($levels as $lvl) { ?>
                            
                                <?php if($lvl['IdFiliere'] == $mjr['IdFiliere']) { ?>
                                
                                    <div class="form-check">
                                
                                        <input class="form-check-input" type="checkbox" value="<?= $lvl['IdNiveau']; ?>" name="check_list[]">
                                
                                        <label class="form-check-label">
                                            <?php echo $lvl['Nom']; ?>
                                        </label>
                                        
                                    </div>
                                
                                <?php } ?>
                                
                            <?php } ?>
                                
                        <?php } ?>
                        </div>
                    
                        <hr>

                        <div class="form-group mb-4">
                                
                            <label class="form-label" >Titre de l'Annonce : </label>
                            <input type="text" name="titre" class="form-control h-25" required>
                        </div>

                        <div class="form-group mb-4">
                            
                            <label class="form-label" >Descriptif de l'Annonce : </label>
                            <input type="text" name="descriptif" class="form-control h-25" required>
                        </div>
                        
                        <!----  importerfile---> 
                        <div class="form-group mb-4">
                            
                            <label class="form-label" >Choisir un fichier pour l'importation:</label>
                            <input type="file" accept=".pdf" name="annonce" class="form-control h-25" required>
                        </div>

                        <input type="submit" name="publier_annonce" class="btn btn-success" id="bouton" value="Publier" onclick="return confirm('Vous etes sure effectuer cette operation ?')">

                    
                                
                </form>

                <?php if(isset($_SESSION['annonce_valide'])) {?>
                    <div class="alert alert-success d-flex align-items-center" role="alert">
                        <div>
                            <?php echo $_SESSION['annonce_valide'];?>
                        </div>
                    </div>
                    <?php unset($_SESSION['annonce_valide']); ?>
                <?php } ?>

                <?php if(isset($_SESSION['annonce_invalide'])) {?>
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <div>
                            <?php echo $_SESSION['annonce_invalide'];?>
                        </div>
                    </div>
                    <?php unset($_SESSION['annonce_invalide']); ?>
                <?php } ?>
            
            </div>
        </div>

    </div>
    
</body>
</html>





                   