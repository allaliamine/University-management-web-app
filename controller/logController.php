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


    public function getAllLogins(){
        
        $res = $this->logs->getAllLogins();

        return $res;

    }


    public function getAllAuthentifications(){

        $today = new DateTime();
        $dates = [];
        $dates[] = $today->format('Y-m-d');
        for ($i = 1; $i <= 5; $i++) {
            $previousDate = $today->sub(new DateInterval('P1D'))->format('Y-m-d');
            $dates[] = $previousDate;
        }
        
        $dates = array_reverse($dates);
        
        $message = '%authentifier%';
        $res = $this->logs->getAllAuthentifications($message, $dates);


        return $res;
    }


    public function getLogsBycne($cne){
        $res = $this->logs->getLoginbycne($cne);

        return $res;
    }

}











?>