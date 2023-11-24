import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 213.w,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            text,
            style:
                AppTextStyles.textStyle16Medium.copyWith(color: Colors.white),
          )),
    );
  }
}
