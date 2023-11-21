import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';

class CustomButtonOutliendApp extends StatelessWidget {
  const CustomButtonOutliendApp({
    super.key,
    required this.text,
    this.onPressed,
    required this.buttonStyle,
  });
  final String text;
  final void Function()? onPressed;
  final ButtonStyle? buttonStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 90,
      child: OutlinedButton(
          style: buttonStyle,
          onPressed: onPressed,
          child: Text(
            text,
            style: AppTextStyles.textStyle8Regular.copyWith(fontSize: 10),
          )),
    );
  }
}
