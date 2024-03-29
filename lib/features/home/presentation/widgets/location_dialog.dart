import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/config/themes/app_text_styles.dart';
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
          Text(
            "Grant permission for the Store-ify \n to access the geographic \n location of this device? ",
            textAlign: TextAlign.center,
            style: AppTextStyles.textStyle16Medium,
          ),
          SizedBox(height: 24.h),
          CustomGeneralButton(
            text: "Ok",
            onPressed: onPressedButton,
          ),
        ],
      ),
    );
  }
}
