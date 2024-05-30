<?php

require_once '../model/calendrierModel.php';


class calendrierController{

  private $calendrierModel;

  public function __construct() {
    $this->calendrierModel = new calendrierModel();
  }


  /*function to add the event in table of delais de rapport */
  public function insertDelaisRapport($titre,$dateStart,$dateEnd,$idNiveau){
     
    $this->calendrierModel->insertDelaisRapport($titre,$dateStart,$dateEnd,$idNiveau);
    
  }

  public function fetchEventNiveau($idNiveau){
      $res =$this->calendrierModel->fetchEventNiveau($idNiveau);
      return $res;
  }
}
?>