<?php
declare(strict_types=1);

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["Submit"])) {
    if (isset($_POST["module"]) && !empty($_POST["module"])) {
        require_once 'config_session.inc.php';
        $_SESSION["module"]=$_POST["module"];
        header("Location: ../interface/postule_doc.php");
    } else {
        echo "Please select a module.";
    }
} else {
   die("Location: ../interface/publier_note.php");
}
