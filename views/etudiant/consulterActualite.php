<?php
session_start();
require_once '../../securite.php';
require_once '../../config/conn.php';
include '../../includes/sidebar_etd.php';

if (isset($_SESSION['allnotification']) ) {
    $res = $_SESSION['allnotification'];
    
    // Pagination
    $nbr_element_par_page = 2;
    $nbr_total_notifications = count($res);
    $nbr_de_pages = ceil($nbr_total_notifications / $nbr_element_par_page);

    $page = isset($_GET['page']) ? intval($_GET['page']) : 1;
    $debut = ($page - 1) * $nbr_element_par_page;
    $notifications_page = array_slice($res, $debut, $nbr_element_par_page);

    $rowCount = count($notifications_page);
?>
  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifications</title>
    <link rel="stylesheet" href="style_Etudiant.css">
    <!-- Ajoutez le lien vers Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <style>
       .pagination-link {
       color: #10504f;
}.page-item.active .page-link {
    background-color: #10504f;
    border-color: #10504f;
}

/* Boutons de pagination désactivés */
.page-item.disabled .page-link {
    background-color: lightgray;
    border-color: lightgray;
    color: #10504f;
}.page-item:hover .page-link {
    background-color: #10504f;
    border-color:#10504f;
    color: white;
}
        </style>
</head>
<body>

<div class="card col-xl-8 offset-3 mt-5">
<div class="form-group mb-4">
    <div class="card-header">Nombre d'actualite : <?= $nbr_total_notifications ?></div>
    <div class="card-body">
        <div class="form-group mb-4">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">envoye par</th>
                        <th scope="col">Titre</th>
                        <th scope="col">Date</th>
                        <th scope="col">Operation</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($notifications_page as $row) { ?>
                        <tr>
                            <td>Edunet</td>
                            <td><?= $row["Titre"] ?></td>
                            <td><?= $row["date"] ?></td>
                            <td>
                            
                                 <a href='../../routing/routing.php?idActualite=<?= $row["IdAnnonce"] ?>' >Lire</a>
                            </td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Ajoutez la barre de pagination Bootstrap ici -->
        <nav>
            <ul class="pagination flex-wrap">
                <!-- Bouton "Début" -->
                <li class="pagination-link page-item <?= $page == 1 ? 'disabled' : '' ?>">
                    <a href="./consulterActualite.php" class="page-link pagination-link">Début</a>
                </li>
                <!-- Bouton "Précédente" -->
                <li class="pagination-link page-item <?= $page == 1 ? 'disabled' : '' ?>">
                    <a href="./consulterActualite.php?page=<?= $page - 1 ?>" class="page-link pagination-link">Précédente</a>
                </li>
                <!-- Afficher les liens vers chaque page -->
                <?php for ($i = 1; $i <= $nbr_de_pages; $i++) { ?>
                    <li class="pagination-link page-item <?= $i == $page ? 'active' : '' ?>">
                        <a href="./consulterActualite.php?page=<?= $i ?>" class="page-link pagination-link"><?= $i ?></a>
                    </li>
                <?php } ?>
                <!-- Bouton "Suivante" -->
                <li class="pagination-link page-item <?= $page == $nbr_de_pages ? 'disabled' : '' ?>">
                    <a href="./consulterActualite.php?page=<?= $page + 1 ?>" class="page-link pagination-link">Suivante</a>
                </li>
                <!-- Bouton "Fin" -->
                <li class="pagination-link page-item <?= $page == $nbr_de_pages ? 'disabled' : '' ?>">
                    <a href="./consulterActualite.php?page=<?= $nbr_de_pages ?>" class="page-link pagination-link">Fin</a>
                </li>
            </ul>
        </nav>

    </div>
</div>
</div>
<?php } ?>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Sélectionnez tous les liens "Lire"
        var readLinks = document.querySelectorAll('tbody a');

        // Ajoutez un gestionnaire d'événements à chaque lien
        readLinks.forEach(function (link) {
            link.addEventListener('click', function () {
                // Trouvez la ligne parente de l'annonce (tr)
                var announcementRow = link.closest('tr');

                // Ajoutez la classe CSS pour marquer l'annonce comme lue
                announcementRow.classList.add('annonce-lue');
            });
        });
    });
</script>

<!-- Ajoutez le script de Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
