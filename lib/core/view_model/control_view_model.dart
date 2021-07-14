import 'package:e_commerce/view/screens/account_screen.dart';
import 'package:e_commerce/view/screens/cart_screen.dart';
import 'package:e_commerce/view/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController{

  List<Widget> listScreens = [
    CartPage(),
    HomePage(),
    AccountPage(),
  ];
  int currentNavIndex = 1;
  void changeNavIndex(index){
    currentNavIndex = index;
    update();
  }
}