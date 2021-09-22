<?php

class products extends db{
    public function GetAll()
    {
        $sql=self::$connect->prepare("SELECT * FROM `products`");
        return $this->select($sql);
    }
    public function GetAllProDuct()
    {
        $sql=self::$connect->prepare("SELECT * FROM `products` WHERE 1 ORDER BY id DESC");
        return $this->select($sql);
    }
    public function GetName()
    {
        $sql=self::$connect->prepare("SELECT * FROM `manufactures` WHERE 1");
        return $this->select($sql);
    }
    public function GetPRoductByName($id)
    {
        $sql=self::$connect->prepare("SELECT * FROM `products` WHERE manu_ID = $id");
        return $this->select($sql);
    }
    public function PhanTrangMenu($id,$SoTrang,$SoSP1Trang)
    {
        $from=($SoTrang-1)*$SoSP1Trang;
        $sql=self::$connect->prepare("SELECT * FROM `products` WHERE manu_ID = $id LIMIT  $from,$SoSP1Trang");
        return $this->select($sql);
    }
    public function GetProductByID($id)
    {
        $sql=self::$connect->prepare("SELECT * FROM `products` WHERE id = ? ");
        $sql->bind_param('i',$id);
        return $this->select($sql);
    }
    public function SearchKeyword($keyword)
    {
        $sql=self::$connect->prepare("SELECT * FROM `products` WHERE products.name LIKE '%$keyword%' ");
        return $this->select($sql);
    }
    public function PhanTrang($SoTrang,$SoSP1Trang)
    {
        $from=($SoTrang-1)*$SoSP1Trang;
        $sql=self::$connect->prepare("SELECT * FROM `products` ORDER BY id DESC LIMIT  $from,$SoSP1Trang");
        return $this->select($sql);
    }
    public function PhanTrangSearch($keyword,$SoTrang,$SoSP1Trang)
    {
        $from=($SoTrang-1)*$SoSP1Trang;
        $sql=self::$connect->prepare("SELECT * FROM `products` WHERE products.name LIKE '%$keyword%' ORDER BY id DESC LIMIT  $from,$SoSP1Trang");
        return $this->select($sql);
    }
}

?>