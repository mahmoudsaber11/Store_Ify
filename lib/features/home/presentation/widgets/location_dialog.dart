import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';

class LocationDialog extends StatelessWidget {
  const LocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 197),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.locationDialog),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Grant permission for the Store-ify \n to access the geographic \n location of this device? ",
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle16Medium,
          ),
          const SizedBox(
            height: 24,
          ),
          ConditionalBuilder(
            condition: true,
            builder: (context) {
              return SizedBox(
                  height: 33,
                  width: 200,
                  child: CustomGeneralButton(text: "Log in", onPressed: () {}));
            },
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
