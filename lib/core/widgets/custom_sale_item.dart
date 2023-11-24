import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSaleItem extends StatelessWidget {
  const CustomSaleItem({
    super.key,
    required this.image, // Corrected the parameter name
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 209.h,
      width: 149.w,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            image,
            alignment: Alignment.topRight,
            height: 209.h,
            width: 149.w,
            fit: BoxFit.fill,
          ),
          Card(
            elevation: 2,
            child: Container(
              width: 143.w,
              height: 83.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  )),
              child: Padding(
                padding: EdgeInsets.only(left: 9.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text(
                      "Name of product",
                      style: AppTextStyles.textStyle14Regular,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    const Text(
                      "Description about Product",
                      style: AppTextStyles.textStyle8Regular,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        const Text(
                          "250.00 LE",
                          style: AppTextStyles.textStyle9Medium,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        const Text(
                          "450.00 LE",
                          style: AppTextStyles.textStyle7Regular,
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.favorite_border_outlined,
                            size: 19.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
