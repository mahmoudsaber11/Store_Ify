import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';

class PriceOfProduct extends StatelessWidget {
  const PriceOfProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "250.00 LE",
          style: AppTextStyles.textStyle16Medium.copyWith(
              color: AppColors.priceColor, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 32.w),
        Text(
          "450.00 LE",
          style: AppTextStyles.textStyle16Regular.copyWith(
            color: AppColors.iconsColor,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }
}
