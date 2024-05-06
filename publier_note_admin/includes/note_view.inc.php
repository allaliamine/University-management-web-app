<?php
declare(strict_types=1);

function show_filier_niveau(){
    require_once 'note_model.inc.php';
    $filiere=fetch_filier();
    foreach($filiere as $row){
        echo '<div class="btn-group dropend">';
        echo '<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">'.htmlspecialchars($row['Nom']).'</button>';
        echo '<ul class="dropdown-menu">';
        echo '<li><span class="dropdown-item">Choisir un niveau</span></li>';
        $niveau=fetch_niveau($row["IdFiliere"]);
        foreach($niveau as $tt){
            echo '<li><input type="hidden" name="but"><input type="submit" name="niveau" class="dropdown-item" value="'.htmlspecialchars($tt['Nom']).'"></li>';
        }
        echo '</ul>';
        echo '</div>';
    }
}


function show_module(){
    show_filier_niveau();
    if(isset($_POST["but"])) {
        if(isset($_POST["niveau"])){
            $niveau=$_POST["niveau"];
            require_once 'note_model.inc.php';
            $result=id_niveau($niveau);
            $modules=fetch_module($result);
            return $modules;
        }
    }
} 