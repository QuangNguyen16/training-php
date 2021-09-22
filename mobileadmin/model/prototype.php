<?php
class Protype extends db {
    public function getAllProtype(){
        $sql = self::$connect->prepare("SELECT * FROM protypes ");
        return $this->select($sql);
    }
    public function getProtypeByID($id)
    {
        $sql=self::$connect->prepare("SELECT * FROM protypes WHERE protypes.type_ID=$id");

        return $this->select($sql);
    }
    public function UpdateProtype($type_id,$type_name,$type_img,$id)
   {
       $sql=self::$connect->prepare("UPDATE `protypes` SET `type_ID`=$type_id,`type_name`='$type_name',`type_img`='$type_img' WHERE protypes.type_ID=$id");
       return $sql->execute();
   }
   public function DeleteProtype($id)
   {
    $sql=self::$connect->prepare("DELETE FROM `protypes` WHERE protypes.type_ID=$id");

    return $sql->execute();
   }
   public function AddProtype($name,$img)
   {
       $sql=self::$connect->prepare("INSERT INTO `protypes`(`type_name`, `type_img`) VALUES ('$name','$img')");
       return $sql->execute();
   }
}