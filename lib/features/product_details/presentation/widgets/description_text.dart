import 'package:flutter/material.dart';
import 'package:store_ify/config/themes/app_colors.dart';
import 'package:store_ify/config/themes/app_text_styles.dart';

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.textStyle16Medium
          .copyWith(color: AppColors.primaryColor),
    );
  }
}
