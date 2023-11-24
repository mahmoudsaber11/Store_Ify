import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStoresItem extends StatelessWidget {
  const CustomStoresItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          AppAssets.testStores,
          alignment: Alignment.topRight,
          height: 165.h,
          width: 169.w,
        ),
        Card(
          elevation: 2,
          child: Container(
            width: 165.w,
            height: 43.h,
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
                  padding: EdgeInsets.only(left: 27.w),
                  child: Row(
                    children: [
                      const Text(
                        "Spinneys store ",
                        style: AppTextStyles.textStyle14Regular,
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
