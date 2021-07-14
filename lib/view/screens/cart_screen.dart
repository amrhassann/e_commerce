import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/view/custom_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: must_be_immutable
class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller)=>
       Container(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                  itemCount: controller.listSelectedProduct.length,
                  itemBuilder:(context , index)=> Container(
                    height: 170,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                            width: 150,
                            child: Image.network(controller.listSelectedProduct[index].image , fit: BoxFit.fill,)
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Container(
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(text: controller.listSelectedProduct[index].name , color: Colors.black,fontSize: 18,maxLines: 3,),
                                SizedBox(height: 5,),
                                CustomText(text: '${controller.listSelectedProduct[index].price} - EGB' , color: primaryColor,fontSize: 16,),
                                SizedBox(height: 10,),
                                Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.shade200,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  width: MediaQuery.of(context).size.width * .3,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(onTap:(){}, child: Icon(Icons.remove)),
                                      SizedBox(width: 10,),
                                      CustomText(text: '1'),
                                      SizedBox(width: 10,),
                                      GestureDetector(onTap:(){}, child: Icon(Icons.add)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ),

                  separatorBuilder: (context , index)=>SizedBox(height: 15,) ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15 ,right: 15 , top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: 'TOTAL' , color: Colors.grey,),
                      CustomText(text : '1000 - EGB' , color: primaryColor, fontSize: 18,fontWeight: FontWeight.w800,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(primaryColor)
                        ),
                        child: CustomText(text: 'CHECKOUT', color: Colors.white,),
                        onPressed: (){}
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
