import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';

class CustomUser extends StatelessWidget {
  const CustomUser({
    super.key,
    required this.location,
  });
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppAssets.imagesPerson),
        Column(
          children: [
            const Text(
              "Hello, Yasmeen",
              style: TextStyle(
                color: AppColors.appColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Text(
              location,
              style: const TextStyle(
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
