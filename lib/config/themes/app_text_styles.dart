import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/config/themes/app_colors.dart';

class AppTextStyles {
  static TextStyle textStyle16Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.fontPrimaryColor,
  );

  static TextStyle textStyle12Medium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle24Medium = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.fontPrimaryColor,
  );

  static TextStyle textStyle16Regular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle textStyle8Regular = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle textStyle14Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.appColor,
  );

  static TextStyle textStyle9Medium = TextStyle(
    fontSize: 9.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.priceColor,
  );

  static TextStyle textStyle7Regular = TextStyle(
    fontSize: 7.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.discountColor,
    decoration: TextDecoration.lineThrough,
  );
}
