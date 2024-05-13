<?php
declare(strict_types=1);

require_once '../model/todolistModel.php';

class todolistController{

    private $todolist_model;

    public function __construct() {
        $this->todolist_model = new todolistModel();
    }

    function fetch_todo($idprof){
        $result=$this->todolist_model->fetch_todo($idprof);
        return $result;
    }

    function add($task,$idprof){
        $this->todolist_model->add($task,$idprof);
    }

    function delete($id){
        $this->todolist_model->delete($id);
    }

    function edit($id,$task){
        $this->todolist_model->edit($id,$task);
    }

    function terminer($id){
        $this->todolist_model->terminer($id);
    }
}