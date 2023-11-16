import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/home/presentation/widgets/location_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    showDialog(
        context: context,
        builder: (context) {
          return const LocationDialog();
        });
  }

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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
