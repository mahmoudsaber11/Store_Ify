import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonOutlinedApp extends StatelessWidget {
  const CustomButtonOutlinedApp({
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
      height: 30.h,
      width: 90.w,
      child: OutlinedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.textStyle8Regular.copyWith(fontSize: 10.sp),
        ),
      ),
    );
  }
}
