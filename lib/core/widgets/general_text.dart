import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GeneralText extends StatelessWidget {
  const GeneralText({
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    required this.text,
    required this.color,
    super.key,
  });
  final TextAlign? textAlign;
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ));
  }
}
