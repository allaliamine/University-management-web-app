<?php

require_once '../model/notificationEtud.php';
class notificationEtudController{

 
    private $notificationEtud;
  
    public function __construct() {
     

      $this->notificationEtud = new notificationEtud();
    }


 /* Méthode pour récupérer les notifications de rapport pour un niveau spécifique */
public function getNotificationRapportByNiveau($idNiveau) {
  $notifications = $this->notificationEtud->getNotificationRapportByNiveau($idNiveau);
  return $notifications;
}

public function lireNotification($idAnnonce){
   $annonce= $this->notificationEtud->lireNotification($idAnnonce);
   return $annonce;

}
 public function getFiliereName($idFiliere){
  $filiere = $this->notificationEtud->getFiliereName($idFiliere);
  return $filiere;
 }
 public function getlevelName($idNiveau){
  $niveau = $this->notificationEtud->getLevelName($idNiveau);
  return $niveau;
 }

 public function getAllNotification(){
  
     $notificationEtud = new notificationEtud();
     $notifications = $notificationEtud->getAllNotification();
     return $notifications;
 }

  public function showDetailActualite($idAnnonce){

    $notificationEtud = new notificationEtud();
     $notifications = $notificationEtud->showDetailActualite($idAnnonce);
     return $notifications;

  }

  public function isActualitePublic($idActualite){

    $notificationEtud = new notificationEtud();
    $actualite= $notificationEtud->showDetailActualite($idActualite);
    return $actualite;

  }

   
}


?>