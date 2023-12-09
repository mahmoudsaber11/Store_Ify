import 'package:flutter/material.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStoresItem extends StatelessWidget {
  const CustomStoresItem({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(routeName: Routes.storesDetailsViewRoute);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 165.h,
            width: 169.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(image), // Provide the image path
                //  fit: BoxFit.fill, // Adjust the BoxFit as needed
              ),
            ),
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
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Spinneys store ",
                        style: AppTextStyles.textStyle14Regular,
                      ),
                      const SizedBox(
                        width: 9,
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
        ],
      ),
    );
  }
}
