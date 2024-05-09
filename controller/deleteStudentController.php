<?php

require_once '../model/deleteStudent.php';


class deleteStudentController{

  private $deleteStudent;

  public function __construct() {
    $this->deleteStudent = new deleteStudent();
  }


  /*function to show the fields and their levels */
  public function FieldLevel(){
     
    $fieldLevel=$this->deleteStudent->getFieldLevel();
    
    return $fieldLevel;
  }




  //function to show the list of the student in the level
  public function StudentByLevel($idniveau){
       
    $studentsLevel =$this->deleteStudent->getStudentBylevel($idniveau);
    return $studentsLevel;
  }



  public function getStudentByCin($cin){

    $student =$this->deleteStudent->getStudentByCin($cin);
    return $student;
  }



  public function activateAccount($idetud){
     
    $result= $this->deleteStudent->getActivite($idetud);

    if($result['Activite']== 'D'){
      $this->deleteStudent->activateAccount($idetud);
    }else {
      $_SESSION['warning_actif']='Ce compte est deja active';
    }  
  }


  public function desactivateAccount($idetud){
     
    $result= $this->deleteStudent->getActivite($idetud);

    if($result['Activite' ]== 'A'){
      $this->deleteStudent->desactivateAccount($idetud);
    }else {
      $_SESSION['warning_desactif']='Ce compte est deja desactive';
    }  
  }


}

?>