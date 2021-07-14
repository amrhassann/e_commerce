import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/home_service.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  ValueNotifier<bool> loading = ValueNotifier(false);
  List<CategoryModel> categoryList =[];
  List<ProductModel> productList =[];
  final categoryCollection = FirebaseFirestore.instance.collection('categories');
  HomeService homeService = new HomeService();
  HomeViewModel(){
    getCategory();
    getBestSelling();
  }

  getCategory()async {
    loading.value = true;
   homeService.getCategoryByServiceClass().then((value) {
      for( int i=0; i<value.length;i++){
        categoryList.add(CategoryModel.fromJosn(value[i].data()));
        print('getting category data is ok');
        loading.value = false;
      }
    });
    update();
  }

  getBestSelling()async{
    loading.value = true;
    homeService.getProductsByServiceClass().then((value) {
      for(int i=0 ; i<value.length;i++){
        productList.add(ProductModel.formJson(value[i].data()));
        print('getting Products data is ok');
        loading.value = false;
      }
      update();
    });
  }

}