<?php

class SMS
{
    public $sender = 'SayYesPhoto';
    public $login = 'sayyesphoto';
    public $pwd = 'karan666';

    /**
     *  $r - Recipient
     *  $m - Message
     *  $d - Date, default "NOW()"
     */
    public function send($r, $m, $d = false)
    {
        try {
            $pdo = new PDO ("mysql:host=94.249.146.189;dbname=users", 'sayyesphoto', 'karan666');
            $pdo->query("SET NAMES utf8;");
            if ($d == false)
                $pdo->query("INSERT INTO `{$this->login}` (`number`,`message`,`sign`) VALUES ('$r','$m','{$this->sender}')");
            else
                $pdo->query("INSERT INTO `{$this->login}` (`number`,`message`,`sign`,`send_time`) VALUES ('$r','$m','{$this->sender}','$d')");
        } catch (Exception $e) {
            $client = new SoapClient ('http://turbosms.in.ua/api/wsdl.html');
            $auth = array(
                'login' => SMS::$login,
                'password' => SMS::$pwd
            );
            $res = $client->Auth($auth);
            $sms = array(
                'sender' => SMS::$sender,
                'destination' => $r,
                'text' => $m
            );
            $res = $client->SendSMS($sms);
        }
    }
}
