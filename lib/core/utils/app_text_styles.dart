import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';

class AppTextStyles {
  static const TextStyle textStyle16Medium = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.titleColor);

  static const TextStyle textStyle12Medium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textStyle24Medium = TextStyle(
      fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.titleColor);

  static const TextStyle textStyle16Regular = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textColor);

  static const TextStyle textStyle8Regular = TextStyle(
      fontSize: 8, fontWeight: FontWeight.w400, color: AppColors.textColor);

  static const TextStyle textStyle14Regular = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.appColor);

  static const TextStyle textStyle9Medium = TextStyle(
      fontSize: 9, fontWeight: FontWeight.w500, color: AppColors.priceColor);

  static const TextStyle textStyle7Regular = TextStyle(
      fontSize: 7,
      fontWeight: FontWeight.w400,
      color: AppColors.discountColor,
      decoration: TextDecoration.lineThrough);
}
