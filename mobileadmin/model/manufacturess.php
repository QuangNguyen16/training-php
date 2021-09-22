<?php
class Manufacturess extends db {
    public function getAllManufactures(){
        $sql = self::$connect->prepare("SELECT * FROM manufactures");
        return $this->select($sql);
    }

    public function deteleManufactures($id){
        $sql=self::$connect->prepare("DELETE FROM manufactures WHERE manu_ID=?");
        $sql->bind_param('i', $id);
        return $sql->execute();
    }
    public function GetManuByID($id)
    {
        $sql=self::$connect->prepare("SELECT * FROM manufactures  WHERE manu_ID=? ");
        $sql->bind_param('i',$id);
        return $this->select($sql);
    }
   public function AddManu($name,$img)
   {
       $sql=self::$connect->prepare("INSERT INTO `manufactures`(`manu_name`, `manu_img`) VALUES ('$name','$img')");
       return $sql->execute();
   }
   public function UpdateManu($manu_id,$manu_name,$manu_img,$id)
   {
       $sql=self::$connect->prepare("UPDATE `manufactures` SET `manu_ID`=$manu_id,`manu_name`='$manu_name',`manu_img`='$manu_img' WHERE manu_ID=$id");
       return $sql->execute();
   }
}