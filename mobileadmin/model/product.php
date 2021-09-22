<?php 

class Product extends db{

    public function GetAllProduct()
    {
        $sql= self::$connect->prepare("SELECT * FROM `products` ORDER BY `ID` DESC  ");
        return $this->select($sql);
    }
    public function GetProductByID($id)
    {
        $sql=self::$connect->prepare("SELECT * FROM products  WHERE ID=? ");
        $sql->bind_param('i',$id);
        return $this->select($sql);
    }
    public function GetAllNameManu()
    {
        $sql=self::$connect->prepare("SELECT manu_name FROM `manufactures`");
        return $this->select($sql);
    }
    public function GetProductByName($name1)
    {
        $sql=self::$connect->prepare("SELECT * FROM products join manufactures on products.manu_ID=manufactures.manu_ID WHERE manufactures.manu_name LIKE '$name1'    ");
      //  $sql->bind_param('s',$name1);
        return $this->select($sql); 
    }
    public function Searchkeyword($name2)
    {
        $sql=self::$connect->prepare("SELECT * FROM products WHERE products.name LIKE '%$name2%' ");
        return $this->select($sql);
    }
    public function PhanTrang($trang,$spxuathien){
       $from=($trang-1)*$spxuathien;
       if($from<0) $from=0;
       $sql= self::$connect->prepare("SELECT * FROM products,manufactures,protypes  WHERE products.manu_ID=manufactures.manu_ID and products.type_ID=protypes.type_ID ORDER BY products.id DESC LIMIT  $from,$spxuathien ");
       return $this->select($sql);
    }
    public function GetAll()
    {
        $sql= self::$connect->prepare("SELECT * FROM products,manufactures,protypes  WHERE products.manu_ID=manufactures.manu_ID and products.type_ID=protypes.type_ID ORDER BY products.id desc   ");
        return $this->select($sql);
        
    }
    public function Searchkeyword2($name2)
    {
        $sql= self::$connect->prepare("SELECT * FROM products,manufactures,protypes WHERE products.manu_ID=manufactures.manu_ID and products.type_ID=protypes.type_ID AND products.name like '%$name2%' ORDER BY products.id DESC  ");
        return $this->select($sql);
    }
    public function DeletedProduct($id)
    {
         $sql=self::$connect->prepare("DELETE FROM products WHERE id = $id");
         return $sql->execute();
    }
    public function AddProduct($name, $price,$image,$description, $manu_ID, $type_ID)
    {
        $sql=self::$connect->prepare("INSERT INTO `products`(`name`, `price`, `image`, `description`, `manu_ID`, `type_ID`) VALUES ('$name', $price,'$image','$description',$manu_ID,  $type_ID)");
        return $sql->execute();
    }
    public function GetAllById($id)
    {   
        $sql=self::$connect->prepare("SELECT * FROM products,manufactures,protypes WHERE products.manu_ID=manufactures.manu_ID and products.type_ID=protypes.type_ID and products.id= $id");
        return $this->select($sql);
    }
    public function UpdateProduct($name,$price,$image,$description, $manu_ID, $type_ID,$id)
    {
        $sql=self::$connect->prepare("UPDATE `products` SET `name`='$name',`price`=$price,`image`='$image',`description`='$description',`manu_ID`=$manu_ID,`type_ID`=$type_ID WHERE products.id=$id");
        return $sql->execute();
    }
}

?>  