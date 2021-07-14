import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/custom_widgets/custom_button.dart';
import 'package:e_commerce/view/custom_widgets/custom_text.dart';
import 'package:e_commerce/view/custom_widgets/custom_text_field.dart';
import 'package:e_commerce/view/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Get.offAll(LoginScreen());
          },
        ),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Sign Up',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),

                SizedBox(
                  height: 50,
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Name',
                        hit: 'Enter your name',
                        onSaved: (value) {
                          controller.name = value;
                        },
                        validator: (value) {
                          if (value == null) {
                            print('error');
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      CustomTextField(
                        label: 'Email',
                        hit: 'username@gmail.com',
                        onSaved: (value) {
                          controller.email = value;
                        },
                        validator: (value) {
                          if (value == null) {
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
                          controller.password = value;
                        },
                        validator: (value) {
                          if (value == null) {
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
                      CustomButton(
                        label: 'SIGN UP ',
                        onPressed: () {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                            controller.createAccountWithEmailAndPass();
                          } else {
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
              ],
            ),
          ),
        ],
      )
    );
  }
}
