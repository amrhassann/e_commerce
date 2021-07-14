import 'package:e_commerce/core/helper/hex_color.dart';
import 'package:flutter/material.dart';
class ProductModel{
   String name;
   String price;
   String description;
   String sized;
   Color color;
   String image;
   String productId;

  ProductModel({
    this.color,
    this.description,
    this.image,
    this.name,
    this.price,
    this.sized,
    this.productId
});

 ProductModel.formJson(Map<dynamic,dynamic>map){
   if(map==null){
     return;
   }
   name = map['name'];
   color = HexColor.fromHex(map['color']);
   description = map['description'];
   price = map['price'];
   sized = map['sized'];
   image = map['image'];
   productId = map['productId'];
 }
 toJson(){
   return{
     'name': name,
     'image': image,
     'description': description,
     'price': price,
     'sized': sized,
     'color': color,
     'productId': productId,
   };
 }

}