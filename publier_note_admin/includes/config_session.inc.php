<?php
ini_set('session.use_only_cookies',1);
ini_set('session.use_strict_mode',1);

session_set_cookie_params([
    'lifetime'=> 1800,
    'domain' =>'localhost',
    'path' => '/',
    'secure' => true,
    'httponly' => true
]);

session_start();
if(!isset($_SESSION["last-regeneration"])){
    regenerate_session_id();
}else{
    $interval=60*30;
    if(time() - $_SESSION["last_regeneartion"] >= $interval){
        regenerate_session_id();
    }
}

function regenerate_session_id(){
    session_regenerate_id();
    $_SESSION["last_regeneration"]=time();
}