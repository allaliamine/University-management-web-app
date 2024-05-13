<?php
declare(strict_types=1);
require_once '../config/conn.php';

class todolistModel{

    function fetch_todo($idprof){
        global $conn;
        $query="SELECT * FROM todolist WHERE idprof=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$idprof]);
        $result=$stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

    function add($task,$idprof){
        global $conn;
        $query="INSERT INTO todolist (task,date_created,act,idprof) VALUES (?,NOW(),'Non Termine',?);";
        $stmt=$conn->prepare($query);
        $stmt->execute([$task,$idprof]);
    }

    function delete($id){
        global $conn;
        $query="DELETE FROM todolist WHERE id=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$id]);
    }

    function edit($id,$task){
        global $conn;
        $query="UPDATE todolist SET task=? WHERE id=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$task,$id]);
    }

    function terminer($id){
        global $conn;
        $query="UPDATE todolist SET act='Termine' WHERE id=?;";
        $stmt=$conn->prepare($query);
        $stmt->execute([$id]);
    }

}