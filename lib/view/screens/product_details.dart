import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/view/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
  ProductModel model;
  ProductDetails({this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Image.network(
              model.image ,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: 270,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container( 
                  padding: const EdgeInsets.only(left: 15 ,right: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      CustomText(text: model.name , fontSize: 22,fontWeight: FontWeight.w800,textAlignment: Alignment.center, ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey )
                            ),
                            width: MediaQuery.of(context).size.width *0.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: 'Size'),
                                CustomText(text: model.sized , fontWeight: FontWeight.w700,),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey )
                            ),
                            width: MediaQuery.of(context).size.width *0.4,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: 'Color'),
                                Container(
                                  height: 17,
                                  width: 17,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.grey),
                                      color: model.color
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      CustomText(text: 'Details: ' , fontWeight: FontWeight.w500, fontSize:18 ,),
                      SizedBox(height: 10,),
                      CustomText(text: model.description  , lineSpace: 2.5,),

                    ],
                  ),
                ),
              ),
            ),
            GetBuilder<CartViewModel>(
              init: CartViewModel(),
              builder: (controller)=>Container(
                padding: const EdgeInsets.only(left: 15 ,right: 15 , top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'PRICE' , color: Colors.grey,),
                        CustomText(text : '${model.price} - EGB' , color: primaryColor, fontSize: 18,fontWeight: FontWeight.w800,),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(primaryColor)
                        ),
                        child: CustomText(text: 'ADD', color: Colors.white,),
                          onPressed: (){
                           print('add button pressed');
                            controller.addToCart(
                              CartProductModel(
                                name: model.name,
                                image: model.image,
                                price: model.price,
                                quantity: 1,
                                productId: model.productId,
                              ),
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
