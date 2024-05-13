<?php
session_start();
require_once '../../includes/sidebar_admin.php';


$logins = $_SESSION['logins'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="./style_admin.css">
</head>
<body>
    <div class="card col-xl-8 offset-3 mt-5 overflow-scroll">
        <div class="card-header">Formulaire d'Activite des utilisateurs</div>
        <div class="card-body">        
                <div class="form-group mb-4">
                    <table class="table table-hover">

                        <thead>
                            <tr>
                                <th>Adresse IP</th>
                                <th>Criticite</th>
                                <th>CNE/CIN</th>
                                <th>Date</th>
                                <th>heure</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            <?php foreach ($logins as $log){ ?> 
                            <tr <?php if ($log['Criticite'] == 'error' ) echo 'class="table-danger"'; ?>>
                                <td><?= $log['AdressIP'];?></td>
                                <td><?= $log['Criticite']; ?></td>
                                <td><?= $log['CNE']; ?></td>
                                <td><?= $log['Date']; ?></td>
                                <td><?= $log['Heure']; ?></td>
                                <td><?= $log['action']; ?></td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>

            </form>
            
        </div>
    </div>


    
</body>
</html>