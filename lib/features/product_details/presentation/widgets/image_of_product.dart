import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/app_assets.dart';

class ImageOfProduct extends StatelessWidget {
  const ImageOfProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.details,
          height: 203.h,
          width: 205.w,
        ),
        Padding(
          padding: EdgeInsets.only(left: 22.w),
          child: Column(
            children: [
              Image.asset(AppAssets.details1),
              SizedBox(
                height: 9.h,
              ),
              Image.asset(AppAssets.details2),
            ],
          ),
        ),
      ],
    );
  }
}
