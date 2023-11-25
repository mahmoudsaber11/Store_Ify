import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';

class LocationDialog extends StatelessWidget {
  const LocationDialog({super.key, required this.onPressedButton});
  final void Function()? onPressedButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 197),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40).r, color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.locationDialog),
          SizedBox(height: 32.h),
          const Text(
            "Grant permission for the Store-ify \n to access the geographic \n location of this device? ",
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle16Medium,
          ),
          SizedBox(height: 24.h),
          ConditionalBuilder(
            condition: true,
            builder: (context) {
              return SizedBox(
                  height: 33.h,
                  width: 200.w,
                  child: CustomGeneralButton(
                      text: "Ok", onPressed: onPressedButton));
            },
            fallback: (context) =>
                const Center(child: CustomCircularProgressIndicator()),
          )
        ],
      ),
    );
  }
}
