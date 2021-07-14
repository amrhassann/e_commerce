
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/custom_widgets/custom_text.dart';
import 'package:e_commerce/view/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
// ignore: must_be_immutable
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth _auth = FirebaseAuth.instance;
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller)=>
         controller.loading.value?Center(child: CircularProgressIndicator())
         : SafeArea(
          child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Column(
                children: [
                  _searchField(),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: "Categories",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,

                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _listViewCategory(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Best Selling",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomText(
                        text: "See all",
                        fontSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _listViewProducts(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchField (){
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none ,
          prefixIcon: Icon(Icons.search , color: Colors.black,),
        ),
      ),
    );
  }
  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
     builder: (controller)=> Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryList[index].image),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: controller.categoryList[index].name,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller)=> Container(
        height: 350,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: controller.productList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Get.to(ProductDetails(model: controller.productList[index],));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                          controller.productList[index].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productList[index].name,
                      textAlignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CustomText(
                        text: controller.productList[index].description,
                        color: Colors.grey,
                        textAlignment: Alignment.bottomLeft,
                        maxLines: 2,

                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: '${controller.productList[index].price}  Egbْْ',
                      color: primaryColor,
                      textAlignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}






