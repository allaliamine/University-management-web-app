<?php
session_start();


require_once '../../includes/sidebar_prof.php';
$prof = $_SESSION['prof'];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Information de Compte</title>
    <link rel="stylesheet" href="./style_Prf.css">
</head>
<body>
        <div class="card col-xl-8 offset-3 mt-5">

            <div class="card-header">Information du Compte</div>

            <div class="card-body">

                    <div class="form-group mb-1 d-flex">
                        <h6 class="text-decoration-underline"> Nom :</h6>
                        <h6>  &nbsp; <?= $prof['Nom'] ?></h6>
                    </div>
                

                    <div class="form-group mb-1 d-flex">
                        <h6 class="text-decoration-underline"> Prenom :</h6>
                        <h6>  &nbsp; <?= $prof['Prenom'] ?></h6>
                    </div>

                    <div class="form-group mb-1 d-flex">
                        <h6 class="text-decoration-underline"> CIN :</h6>
                        <h6> &nbsp; <?= $prof['CIN'] ?></h6>
                    </div>

                    <div class="form-group mb-1 d-flex">
                        <h6 class="text-decoration-underline"> Email :</h6>
                        <h6> &nbsp; <?= $prof['Email'] ?></h6>
                    </div>

                    <div class="form-group mb-1 d-flex">
                        <h6 class="text-decoration-underline"> Telelphone :</h6>
                        <h6>  &nbsp; <?= "0".$prof['Tel'] ?></h6>
                    </div>


                
            </div>
        </div>
    
</body>
</html>