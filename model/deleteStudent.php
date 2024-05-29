
<?php
require_once "../config/conn.php";

class deleteStudent{

    //get name of the field and of the level, and its Id:
    public function getFieldLevel(){
        global $conn;

        $req = $conn->prepare('SELECT Filiere.Nom as NomFiliere, Niveau.Nom as NomNiveau, Niveau.IdNiveau  FROM Filiere
        left join Niveau on Filiere.IdFiliere = Niveau.IdFiliere
        ORDER BY Filiere.IdFiliere, Niveau.IdNiveau');
        $req->execute();
        $res = $req->fetchAll();

        return $res;
}


    public function getStudentBylevel($idniveau){

        global $conn;

        $sql= $conn->prepare("SELECT IdEtudiant, CIN ,Nom, Prenom , Activite
        FROM Etudiant where IdNiveau =? ");
        $sql->execute([$idniveau]);
        $res = $sql->fetchAll();
        return $res;
            
    }


    public function getStudentByCin($cin){

        global $conn;
        
        $req = $conn->prepare('select * from Etudiant where CIN=? ');
        $params = array($cin);
        $req->execute($params);
        $res = $req->fetch();

        return $res;

    }

    public function getActivite($idetud){
        global $conn;
        
        $req= $conn->prepare('SELECT * FROM Etudiant WHERE IdEtudiant= ?');
        $params= array($idetud);
        $req->execute($params);
        $res = $req->fetch();
        return $res;
    }


    public function activateAccount($idetud){
        global $conn;
        
        $res= $this->getActivite($idetud);
        $idcompte= $res['IdCompte'];

        $sql1 = "UPDATE Compte SET Activite='A' WHERE IdCompte=$idcompte";
        $sql2 = "UPDATE Etudiant SET Activite='A' WHERE IdEtudiant=$idetud";
        $r1 = $conn->query($sql1);
        $r2 = $conn->query($sql2);
        return true;
    }

    public function desactivateAccount($idetud){
        global $conn;
        
        $res= $this->getActivite($idetud);
        $idcompte= $res['IdCompte'];

        $sql1 = "UPDATE Compte SET Activite='D' WHERE IdCompte=$idcompte";
        $sql2 = "UPDATE Etudiant SET Activite='D' WHERE IdEtudiant=$idetud";
        $r1 = $conn->query($sql1);
        $r2 = $conn->query($sql2);
        return true;
    }









    }

?>