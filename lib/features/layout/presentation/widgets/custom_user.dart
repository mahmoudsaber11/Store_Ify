import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/assets_data.dart';

class CustomUser extends StatelessWidget {
  const CustomUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AssetsData.person),
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
