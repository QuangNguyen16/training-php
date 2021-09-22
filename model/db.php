<?php

class db{
    public static $connect=NULL;
    public function __construct()
    {
        if(!self::$connect)
        {
            self::$connect=new mysqli(DB_HOST,DB_USER,DB_PASS,DB_NAME);
            self::$connect->set_charset('utf8');
        }
    }
    public function __destruct()
    {
        //self::$connection->close();
    }
    public function select ($sql)
    {
        $item=array();
        $sql->execute();
        $item=$sql->get_result()->fetch_all(MYSQLI_ASSOC);
        return $item;
    }
}


?>