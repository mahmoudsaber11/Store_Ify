import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomUser extends StatelessWidget {
  const CustomUser({
    super.key,
    required this.location,
  });
  final String location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssets.imagesPerson),
          Column(
            children: [
              Text(
                "Mahmoud Saber",
                style: TextStyle(
                  color: AppColors.appColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 10.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
