<?php
declare(strict_types=1);

function fetch_filier(){
    require 'dbh.inc.php';
    $query="SELECT * FROM filiere;";
    $stmt=$pdo->prepare($query);
    $stmt->execute();
    $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
    return $result;
}

function fetch_niveau(int $idfiliere){
    require 'dbh.inc.php';
    $query="SELECT * FROM niveau WHERE IdFiliere=?;";
    $stmt=$pdo->prepare($query);
    $stmt->execute([$idfiliere]);
    $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
    return $result;
}

function fetch_module(int $idniveau){
    require 'dbh.inc.php';
    $query="SELECT * FROM module WHERE IdNiveau=?;";
    $stmt=$pdo->prepare($query);
    $stmt->execute([$idniveau]);
    $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
    return $result;
}

function id_niveau(string $nom){
    require 'dbh.inc.php';
    $query="SELECT * FROM niveau WHERE Nom=?;";
    $stmt=$pdo->prepare($query);
    $stmt->execute([$nom]);
    $result=$stmt->fetch(PDO::FETCH_ASSOC);
    $id=$result['IdNiveau'];
    return $id;
}


function upload_note(float $Valeur, int $idModule, int $idAdmin, int $idEtudiant){
    require 'dbh.inc.php';
    $query="INSERT INTO note (Valeur,idModule,idAdmin,idEtudiant) VALUES (?,?,?,?);";
    $stmt=$pdo->prepare($query);
    $stmt->execute([$Valeur,$idModule,$idAdmin,$idEtudiant]);
}

function get_id_etd(string $CNE){
    require 'dbh.inc.php';
    $query="SELECT * FROM etudiant WHERE CNE=?;";
    $stmt=$pdo->prepare($query);
    $stmt->execute([$CNE]);
    $result=$stmt->fetch(PDO::FETCH_ASSOC);
    $id=$result['IdEtudiant'];
    return $id;
}

function get_id_module(string $module){
    require 'dbh.inc.php';
    $query="SELECT * FROM module WHERE Intitule=?;";
    $stmt=$pdo->prepare($query);
    $stmt->execute([$module]);
    $result=$stmt->fetch(PDO::FETCH_ASSOC);
    $id=$result['IdModule'];
    return $id;
}