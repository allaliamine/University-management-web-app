<?php

require_once '../model/LoggingModel.php';


class loginController{

    private $logs;

    public function __construct() {
        $this->logs = new logginModel();
    }


    public function createAction($cne,$critice,$action,$idcompte){

        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }

        $date = date("Y-m-d");
        date_default_timezone_set('Africa/Casablanca');
        $time = date('H:i:s');

        $admin = 1;

        $this->logs->insertIntoLogging($cne,$ip,$date,$time,$critice,$action,$admin,$idcompte);


    }





}













?>