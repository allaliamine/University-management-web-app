<?php
session_start();
include '../../includes/sidebar_admin.php';


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editer Compte</title>
    <link rel="stylesheet" href="./style_admin.css">
</head>
<body>
    <div class="card col-xl-8 offset-3 mt-5">
        
        <div class="card-header">Espace de modification de compte</div>
        <div class="card-body">
            <form action="../../routing/routing.php" method="post">

                <div class="form-group mb-4">
                    <h5>Changement de donnees personnelles : </h5>
                    <label for="email" >Adresse Email</label>
                    <input type="email" name="email" class="form-control h-25" placeholder="<?= $_SESSION['admin']['Email']?>">
                </div>

                <div class="form-group mb-4">
                    <label>Numero de Telephone</label>
                    <input type="text" name="numero" class="form-control h-25" placeholder="<?= "0".$_SESSION['admin']['Tel']?>">
                </div>

                <div class="form-group mb-4">
                    <h5>Changement de Mot de passe : </h5>
                    <label>Entrer l'ancien Mot de passe</label>
                    <input type="password" name="mdp-1" class="form-control h-25">
                </div>

                <div class="form-group mb-4">

                    <label>Mot de passe</label>
                    <input type="password" name="mdp" class="form-control h-25">
                </div>

                <div class="form-group mb-4">
                    <label>Confirmer Mot de passe</label>
                    <input type="password" name="mdp2" class="form-control h-25" >
                </div>

                
                <input type="submit" name="compteAdmin" class="btn btn-success mb-4" id="bouton" value="changer mes donnees" >
                
                <?php if(isset($_SESSION['editer-success'])) {?>
                    <div class="alert alert-success d-flex align-items-center" role="alert">
                        <div>
                            <?php echo $_SESSION['editer-success'];?>
                        </div>
                    </div>
                    <?php unset($_SESSION['editer-success']); ?>
                <?php } ?>

                <?php if(isset($_SESSION['mdp-non-identique'])) {?>
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <div>
                            <?php echo $_SESSION['mdp-non-identique'];?>
                        </div>
                    </div>
                    <?php unset($_SESSION['mdp-non-identique']); ?>
                <?php } ?>

                <?php if(isset($_SESSION['ancienn-mdp-invalide'])) {?>
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <div>
                            <?php echo $_SESSION['ancienn-mdp-invalide'];?>
                        </div>
                    </div>
                    <?php unset($_SESSION['ancienn-mdp-invalide']); ?>
                <?php } ?>

                <?php if(isset($_SESSION['tel-invalide'])) {?>
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <div>
                            <?php echo $_SESSION['tel-invalide'];?>
                        </div>
                    </div>
                    <?php unset($_SESSION['tel-invalide']); ?>
                <?php } ?>

                <?php if(isset($_SESSION['email-invalide'])) {?>
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <div>
                            <?php echo $_SESSION['email-invalide'];?>
                        </div>
                    </div>
                    <?php unset($_SESSION['email-invalide']); ?>
                <?php } ?>

                <?php if(isset($_SESSION['mdp-success'])) {?>
                    <div class="alert alert-success d-flex align-items-center" role="alert">
                        <div>
                            <?php echo $_SESSION['mdp-success'];?>
                        </div>
                    </div>
                    <?php unset($_SESSION['mdp-success']); ?>
                <?php } ?>





            </form>
        </div>
        
    </div>
</body>
</html>