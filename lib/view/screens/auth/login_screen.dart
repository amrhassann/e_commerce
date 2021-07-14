import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/custom_widgets/custom_button.dart';
import 'package:e_commerce/view/custom_widgets/custom_social_button.dart';
import 'package:e_commerce/view/custom_widgets/custom_text.dart';
import 'package:e_commerce/view/custom_widgets/custom_text_field.dart';
import 'package:e_commerce/view/screens/auth/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: ScrollPhysics(),
          children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(left: 25 , right: 25,top: 25),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Welcome',
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(RegisterScreen());
                          },
                          child: CustomText(
                            text: 'Sign Up ',
                            fontSize: 18,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: 'Sign in to Continue',
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            label: 'Email',
                            hit: 'username@gmail.com',
                            onSaved: (value) {
                              controller.email=value;
                            },
                            validator: (value) {
                              if(value==null){
                                print('error');
                              }
                            },
                          ),

                          SizedBox(
                            height: 40,
                          ),
                          CustomTextField(
                            label: 'Password',
                            hit: '**********',
                            onSaved: (value) {
                              controller.password=value;
                            },
                            validator: (value) {
                              if(value==null){
                                print('error');
                              }
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomText(
                            text: 'Forget Password?',
                            textAlignment: Alignment.topRight,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(label: 'SIGN IN ',
                            onPressed: (){
                            _formKey.currentState.save();
                            if(_formKey.currentState.validate()){
                              controller.signInWithEmailAndPass();
                            }else{
                              print('========================validate error');
                            }


                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),

                  ],),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(text: '- OR -',textAlignment: Alignment.center,),
                SizedBox(
                  height: 20,
                ),
                // CustomSocialButton(
                //   imageUrl: 'assets/images/facebook.png',
                //   label: 'Sign In with',
                //   onPressed: (){
                //     // controller.facebookLoginMethod();
                //
                //   },
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                CustomSocialButton(
                  imageUrl: 'assets/images/google.png',
                  label: 'Sign In with',
                  onPressed: (){
                    controller.googleSignInMethod();

                  },
                ),
              ],

        ),
      ),
    );
  }
}
