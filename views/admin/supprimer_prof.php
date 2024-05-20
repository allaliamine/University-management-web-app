<?php
session_start();

require_once "../../includes/sidebar_admin.php";

$res = $_SESSION['getProf'];



?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../admin/style_admin.css">
    <title>Retrancher Prof</title>
</head>
<body>
<div class="card col-xl-8 offset-3 mt-5">

    <?php if(isset($_SESSION['success-actif'])) { ?>
            <div class="alert alert-success d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['success-actif'];?>
                </div>
            </div>
        <?php unset($_SESSION['success-actif']); ?>
    <?php } ?>

    <?php if(isset($_SESSION['error-actif'])) { ?>
            <div class="alert alert-danger d-flex align-items-center" role="alert">
                <div>
                    <?php echo $_SESSION['error-actif'];?>
                </div>
            </div>
        <?php unset($_SESSION['error-actif']); ?>
    <?php } ?>

    <div class="card-header">Retrancher Profs</div>

    <div class="card-body">

        <form action="../../routing/routing.php" method="post" class="form">

                <div class="form-group mb-4">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>CNE</th>
                                    <th>Nom</th>
                                    <th>Prénom</th>
                                    <th>Activité</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($res as $row) { ?>
                                    <tr>
                                        <td><?= $row["IdProf"] ?></td>
                                        <td><?= $row["CIN"] ?></td>
                                        <td><?= $row["Nom"] ?></td>
                                        <td><?= $row["Prenom"] ?></td>
                                        <td><?= $row["Activite"] ?></td>
                                        <td>
                                            <a type="submit" name="Activer" class="btn btn-success" href="../../routing/routing.php?Prof=activer&id=<?= $row['IdProf'] ?>&compte=<?= $row['IdCompte'] ?>"> 
                                                Activer
                                            </a>

                                            <a type="submit" name="Desactiver" class="btn btn-danger" href="../../routing/routing.php?Prof=desactiver&id=<?= $row['IdProf'] ?>&compte=<?= $row['IdCompte'] ?>">
                                                Desactiver
                                            </a>
                                        </td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>      
        </form>    
        

    </div>
</div>

</body>
</html>
