<?php
session_start();
//echo $_SESSION['error'];


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.1/css/all.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="./style_log.css">
    <title>login | Edu-net</title>
</head>
<body>
    <div class="container">

        <div class="row justify-content-center">

            <div class="col-xl-8 col-lg-9 col-md-9">
            <?php if(isset($_SESSION['Activite'])) { ?>
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                    <div>
                        <?php echo $_SESSION['Activite'];?>
                    </div>
                </div>
                <?php unset($_SESSION['Activite']); ?>
            <?php } ?>

            <?php if(isset($_SESSION['error'])) { ?>
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                    <div>
                        <?php echo $_SESSION['error'];?>
                    </div>
                </div>
                <?php unset($_SESSION['error']); ?>
            <?php } ?>

                <div class="card border-0">

                    <div class="card-body p-0">

                        <div class="row">

                            <div class="col-lg-6 left-side">
                                <div class="left-side-insider">

                                    <div class="text-center">
                                        <h4 class="text-dark mb-4">Login</h4>
                                    </div>
                                    <form method="POST" class="user" action="../routing/routing.php">

                                        <div class="form-group">
                                            <input name="login" type="text" class="form-control input-user" placeholder="Enter votre nom d'utilisateur..." required>
                                        </div>

                                        <div class="form-group mt-3">
                                            <input name="password" type="password" class="form-control input-user" placeholder="Saisir votre mot de passe" required>
                                        </div>
                                        <button type="submit" class="btn mt-3" name="submit"> Se connecter</button>

                                    </form>
                        
                                    <div class="text-center mt-3">
                                        <a class="small">Mot de passe oublié ?</a>
                                    </div>

                                </div>
                                <div class="text-center pb-2">Copyright @ 2024 - tous les droits reserves</div>
                            </div>

                            <div class="col-lg-6 right-side py-5 pe-3">
                                <div class="title text-center"><h4>Welcome</h4></div>
                                <div>
                                    <div class="bg-image text-center"></div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>