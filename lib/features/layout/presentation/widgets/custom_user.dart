import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';

class CustomUser extends StatelessWidget {
  const CustomUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppAssets.imagesPerson),
        const Column(
          children: [
            Text(
              "Hello,Yasmeen",
              style: TextStyle(
                color: AppColors.appColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Text(
              "Alexandria,Egypt",
              style: TextStyle(
                color: AppColors.textProfileColor,
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
            ),
          ],
        )
      ],
    );
  }
}
