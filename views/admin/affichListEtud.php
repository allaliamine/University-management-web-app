<?php
// Démarrer la session
session_start();

// Inclure la barre latérale administrateur
require_once "../../includes/sidebar_admin.php";
require_once '../../securiteadmin.php';

if(isset($_SESSION['studentByLevel'])){
    $resLevel = $_SESSION['studentByLevel'];
}

if (isset($_SESSION['studentByCin'])) {
    $resCin = $_SESSION['studentByCin'];
    unset($_SESSION['studentByCin']);
}



?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../admin/style_admin.css">
    <title>Retrancher Etudiant</title>
    <style>
        .table-container {
            margin-left: 80px;
        }

        .cont {
            margin-left: 100px;
        }
    </style>
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

    <div class="card-header">Retrancher les étudiants</div>
    <div class="card-body">
        <form action="../../routing/routing.php" method="post" class="form">
            <!-- Barre de recherche -->
            <div class="form-group mb-4">
                <div class="input-group flex d-flex">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Saisir CIN de l'etudiant"
                           name="cin">
                    <div class="input-group-append">
                        <button class="btn search" type="submit" name="search">
                            <i class="fas fa-search fa-sm"></i>
                        </button>
                    </div>
                </div>
            </div>
        </form>
        <form action="../../routing/routing.php" method="post" class="form">
            <!-- Tableau des étudiants -->
            <?php if (!empty($resLevel)) { ?>
                <div class="form-group mb-4">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">CIN</th>
                                <th scope="col">Nom</th>
                                <th scope="col">Prénom</th>
                                <th scope="col">Activité</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($resLevel as $row) { ?>
                                <tr>
                                    <td><?= $row["IdEtudiant"] ?></td>
                                    <td><?= $row["CIN"] ?></td>
                                    <td><?= $row["Nom"] ?></td>
                                    <td><?= $row["Prenom"] ?></td>
                                    <td><?= $row["Activite"] ?></td>
                                    <td>
                                        <form method="post" action="../../routing/routing.php">
                                            <input type="hidden" name="idEtudiant"
                                                   value="<?= $row["IdEtudiant"] ?>">
                                            <button type="submit" name="activer" value="yes"
                                                    class="btn btn-success">Activer
                                            </button>
                                        </form>
                                    </td>
                                    <td>
                                        <form method="post" action="../../routing/routing.php">
                                            <input type="hidden" name="idEtudiant"
                                                   value="<?= $row["IdEtudiant"] ?>">
                                            <button type="submit" name="desactiver" value="yes"
                                                    class="btn btn-danger">Désactiver
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>

            <?php } else { if(!empty($resCin)) { ?>
                <div class="form-group mb-4">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">CIN</th>
                                <th scope="col">Nom</th>
                                <th scope="col">Prénom</th>
                                <th scope="col">Activité</th>
                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><?= $resCin["IdEtudiant"] ?></td>
                                <td><?= $resCin["CIN"] ?></td>
                                <td><?= $resCin["Nom"] ?></td>
                                <td><?= $resCin["Prenom"] ?></td>
                                <td><?= $resCin["Activite"] ?></td>
                                <td>
                                    <form method="post" action="../../routing/routing.php">
                                        <input type="hidden" name="idEtudiant"
                                               value="<?= $resCin["IdEtudiant"] ?>">
                                        <button type="submit" name="activer" value="yes" class="btn btn-success">Activer
                                        </button>
                                    </form>
                                </td>
                                <td>
                                    <form method="post" action="../../routing/routing.php">
                                        <input type="hidden" name="idEtudiant"
                                               value="<?= $resCin["IdEtudiant"] ?>">
                                        <button type="submit" name="desactiver" value="yes" class="btn btn-danger">Désactiver
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <?php } else { ?>
                    <div class="form-group mb-4">
                        <p>Aucune donnée trouvée.</p>
                    </div>
                <?php } ?>
            <?php } ?>
            
        </form>    
        

    </div>
</div>

</body>
</html>
