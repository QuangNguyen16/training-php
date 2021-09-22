<?php

class cart_user extends db{
    public function addtocart($id,$ten,$sp,$gia,$sl){
        $sql=self::$connect->prepare("INSERT INTO `cart_user`(`id`,`ten_user`,`sanpham`, `gia`, `soluong`) VALUES (?,?,?,?,?)");
        $sql->bind_param('issii',$id,$ten,$sp,$gia,$sl);
        $sql->execute();
    }
    public function updatetocard($sp,$gia,$sl,$id){
        $sql=self::$connect->prepare("UPDATE `cart_user` SET `sanpham`=?,`gia`=?,`soluong`=? WHERE `cart_user`.`id`=?");
        $sql->bind_param('siii',$sp,$gia,$sl,$id);
        $sql->execute();
    }   
    public function DelCartUser($id)
    {
        $sql=self::$connect->prepare("DELETE FROM `cart_user` WHERE `cart_user`.`id`=?");
        $sql->bind_param('i',$id);
        return $sql->execute();
    }
}



?>
