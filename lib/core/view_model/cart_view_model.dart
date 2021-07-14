import 'package:e_commerce/core/services/data_base_local/cart_db_helper.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{
  ValueNotifier<bool> loading = ValueNotifier(false);
  List<CartProductModel> listSelectedProduct =[];
  CartViewModel(){
    getAllProduct();
  }

  addToCart(CartProductModel model)async{
    if(listSelectedProduct.length==0){
      await CartDBHelper.db.insert(model);
    }else{
      for(int i=0; i<listSelectedProduct.length;i++){
        if(listSelectedProduct[i].productId==model.productId){
          return;
        }else{
          await CartDBHelper.db.insert(model);
          update();
        }
      }
    }
  }

  getAllProduct()async{
    loading.value = true;
    var dbHelper = CartDBHelper.db;
    listSelectedProduct = await dbHelper.getAllProduct();
    print('ooooooooooooooooooooooooooooooooo ${listSelectedProduct.length}');
    loading.value = false;
    update();
  }
}