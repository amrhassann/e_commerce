import 'package:e_commerce/view/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hit;
  final Function onSaved;
  final Function validator;

  CustomTextField({this.label, this.hit, this.onSaved, this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: label,
            color: Colors.grey.shade900,
          ),
          TextFormField(
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
              hintText: hit,
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
