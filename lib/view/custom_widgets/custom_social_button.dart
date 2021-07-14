import 'package:e_commerce/view/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String imageUrl;
  final String label;
  final Function onPressed;

  const CustomSocialButton({this.imageUrl, this.label, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
      ),
      // ignore: deprecated_member_use
      child: FlatButton(
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: label,
                textAlignment: Alignment.center,
              ),
              SizedBox(
                width: 20,
              ),
              Container(width: 20, child: Image.asset(imageUrl)),
            ],
          )),
    );
  }
}
