<?php
session_start();
require_once '../../securiteprof.php';
require_once '../../includes/sidebar_prof.php';
$cours = $_SESSION['cours'];



?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Archiver Cours</title>
    <link rel="stylesheet" href="./style_Prf.css">
</head>
<body>

    <div class="card col-xl-8 offset-3 mt-5 overflow-scroll">

        <div class="card-header">Formulaire d'archivage et desarchivage des Cours/TD/TP</div>
        <div class="card-body">
            
                
            <div class="form-group mb-4">

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Nom</th>
                            <th>Etat</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($cours as $crs){ ?> 
                        <tr>
                            <td><?= $crs['Type']?></td>
                            <td><?= $crs['Nom']; ?></td>
                            <td><?= $crs['etat']; ?></td>
                            <td>
                                <a type="submit" name="archiver" class="btn btn-success" href="../../routing/routing.php?operation=archiver&id=<?= $crs['IdCours']?>"> 
                                    archiver
                                </a>
                                <a type="submit" name="desarchiver" class="btn btn-danger" href="../../routing/routing.php?operation=desarchiver&id=<?= $crs['IdCours']?>">
                                    desarchiver
                                </a>
                            </td>
                        </tr>
                        
                        <?php } ?>
                    </tbody>

                </table>
            </div>

            <?php if(isset($_SESSION['archive_success'])) {?>
            <div class="alert alert-success d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['archive_success'];?>
                </div>
            </div>
            <?php unset($_SESSION['archive_success']); ?>
            <?php } ?>

            <?php if(isset($_SESSION['archive_error'])) {?>
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                    <div>
                        <?php echo $_SESSION['archive_error'];?>
                    </div>
                </div>
                <?php unset($_SESSION['archive_error']); ?>
            <?php } ?>
            
        </div>
    </div>
    
</body>
</html>