<?php

session_start();
$notes=$_SESSION['notes'];
require_once '../../securite.php';
include '../../includes/sidebar_etd.php';


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style_Etudiant.css">
</head>
<body>
        <div class="container mt-5" >
                <div class="row">
                    <div class="col-xl-10 offset-2">
                        <div class="card mt-5">
                            <div class="card-header">VOTRE NOTES : </div>
                            <div class="card-body">
                                <?php
                                if ($notes) {
                                    foreach ($notes as $note) {
                                        $noteValue = $note['Valeur'];
                                        ?>
                                        <div class="card mb-3" style="background-color: <?php echo ($noteValue < 12) ? '#ffcdd2' : '#c8e6c9'; ?>">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-sm-12 col-md-6">
                                                        <h5 class="card-title">Module:</h5>
                                                        <p><?php echo $note['Intitule']; ?></p>
                                                    </div>
                                                    <div class="col-sm-12 col-md-6">
                                                        <h5 class="card-title">Valeur:</h5>
                                                        <p><big><?php echo $note['Valeur']; ?></big></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <?php
                                    }
                                } else {
                                    echo "<p>Il n'a pas de notes </p>";
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
</body>
</html>