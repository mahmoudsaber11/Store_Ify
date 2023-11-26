import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_constants.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/auth/presentation/widgets/verification/verification_form.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppConstants.authHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "OTP Verification ",
                style: AppTextStyles.textStyle24Medium,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "We’ve sent a code to $email",
              style: AppTextStyles.textStyle16Regular
                  .copyWith(color: AppColors.subTitleColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 19.h),
            Image.asset(AppAssets.imagesOtpVerification),
            SizedBox(height: 19.h),
            const Center(
              child: Text(
                "OTP Code",
                style: AppTextStyles.textStyle16Medium,
              ),
            ),
            SizedBox(height: 13.h),
            VerificationForm(email: email),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
