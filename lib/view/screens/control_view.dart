import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/control_view_model.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return (Get.find<AuthViewModel>().user ==null)
          ?LoginScreen()
          :GetBuilder<ControlViewModel>(
        init: ControlViewModel(),
          builder: (controller)=> Scaffold(
            body: controller.listScreens[controller.currentNavIndex],
            bottomNavigationBar: buildBottomNavigationBar(),
          ),
      );
    });
  }
  Widget buildBottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller)=> BottomNavigationBar(
        elevation: 0,
        currentIndex: controller.currentNavIndex,
        onTap: (index)=>controller.changeNavIndex(index),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Image.asset('assets/images/Icon_Cart.png'),
            ),
            label: '',
            activeIcon: Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: Column(
                children: [
                  Text('Cart'),
                  SizedBox(height: 5,),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Image.asset('assets/images/Icon_Explore.png'),
            ),
            label: '',
            activeIcon: Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: Column(
                children: [
                  Text('Explore'),
                  SizedBox(height: 5,),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Image.asset('assets/images/Icon_User.png'),
            ),
            label: '',
            activeIcon: Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: Column(
                children: [
                  Text('User'),
                  SizedBox(height: 5,),
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
