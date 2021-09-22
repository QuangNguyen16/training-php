<?php

class User extends db{
    public function getAll(){
        $sql=self::$connect->prepare("SELECT * FROM `user` WHERE 1");
        return $this->select($sql);
    }
    public function getUserbyID($id)
    {
        $sql=self::$connect->prepare("SELECT * FROM `user` WHERE user.ID=$id");
        return $this->select($sql);
    }
    public function getTypeuser()
    {
        $sql=self::$connect->prepare("SELECT * FROM `type_user`");
        return $this->select($sql);
    }
    public function login($name,$password)
    {
        $sql=self::$connect->prepare("SELECT * FROM `user`,`type_user` WHERE username=? and user.password=? and user.type_user=type_user.id ");
        $sql->bind_param('ss',$name,$password);
        return $this->select($sql);
    }
    public function addUser($name,$pass)
    {
        $sql=self::$connect->prepare("INSERT INTO `user`(`username`, `password`,`type_user`) VALUES ('$name','$pass',1)");
        return $sql->execute();
    }
    public function DelUser($id)
    {
        $sql=self::$connect->prepare("DELETE FROM `user` WHERE user.id=?");
        $sql->bind_param('i',$id);
        return $sql->execute();
    }
    public function UpdateUser($name,$password,$type_userm,$id)
    {
        $sql=self::$connect->prepare("UPDATE `user` SET`username`=?,`password`=?,`type_user`=? WHERE user.id=?");
        $sql->bind_param('ssii',$name,$password,$type_userm,$id);
        return $sql->execute();
    }   


}





?>