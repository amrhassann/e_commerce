import 'package:e_commerce/constants.dart';
import 'package:e_commerce/view/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color color;
  const CustomButton({this.onPressed, this.label , this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton(
      color: primaryColor,
      padding: EdgeInsets.all(18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      onPressed: onPressed,
      child: CustomText(
        text: label,
        color: color,
        textAlignment: Alignment.center,
      ),
    );
  }
}
