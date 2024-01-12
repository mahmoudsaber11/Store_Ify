import 'package:flutter/material.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
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
    return GestureDetector(
      onTap: () {
        context.navigateTo(routeName: Routes.productDetailsViewRoute);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 209.h,
            width: 148.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(image), // Provide the image path
                fit: BoxFit.fill, // Adjust the BoxFit as needed
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: Container(
              width: 145.w,
              height: 83.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Name of product",
                    style: AppTextStyles.textStyle14Regular,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Description about Product",
                    style: AppTextStyles.textStyle8Regular,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "250.00 LE",
                        style: AppTextStyles.textStyle9Medium,
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        "450.00 LE",
                        style: AppTextStyles.textStyle7Regular,
                      ),
                      SizedBox(width: 11.w),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite_border_outlined,
                          size: 19.w,
                        ),
                      ),
                    ],
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
