import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment textAlignment;
  final FontWeight fontWeight;
  final int maxLines;
  final double lineSpace;
  CustomText({
    @required this.text,
    this.fontSize,
    this.color = Colors.black,
    this.textAlignment = Alignment.topLeft,
    this.fontWeight = FontWeight.normal,
    this.maxLines= 10,
    this.lineSpace = 1.3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: textAlignment,
      child: Text(
        text,
        maxLines: maxLines,
        overflow:TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: lineSpace,
        ),
      ),
    );
  }
}
