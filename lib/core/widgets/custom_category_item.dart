import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AppAssets.testCategories,
            alignment: Alignment.topRight,
            height: 165.h,
            width: 169.w,
          ),
          Card(
            elevation: 2,
            child: Container(
              width: 165.w,
              height: 53.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35.w),
                    child: const Text(
                      "Electronics",
                      style: AppTextStyles.textStyle14Regular,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Tv,mobile,laptop",
                      style: AppTextStyles.textStyle8Regular,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
