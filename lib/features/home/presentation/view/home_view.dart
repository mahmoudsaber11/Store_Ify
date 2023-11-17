import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_search_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 13),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(AppAssets.imagesPerson),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  children: [
                    Text(
                      "Hello,Yasmeen",
                      style: AppTextStyles.textStyle8Regular
                          .copyWith(color: AppColors.appColor, fontSize: 12),
                    ),
                    Text(
                      "Alexandria,Egypt",
                      style: AppTextStyles.textStyle8Regular
                          .copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            CustomSearchTextField()
          ],
        ),
      ),
    );
  }
}
