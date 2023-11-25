import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_constants.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/auth/presentation/widgets/or_sign_in_with_text.dart';
import 'package:store_ify/features/auth/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:store_ify/features/auth/presentation/widgets/sign_with_social.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppConstants.authHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40.h),
              child: const Text(
                "Sign Up",
                style: AppTextStyles.textStyle24Medium,
              ),
            ),
            SizedBox(height: 5.h),
            const Text(
              "Create an account",
              style: AppTextStyles.textStyle16Medium,
            ),
            SizedBox(height: 45.h),
            const SignUpForm(),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () => context.getBack(),
                child: Text(
                  "Login",
                  style: AppTextStyles.textStyle16Regular.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            const OrSignInWithText(),
            SizedBox(height: 24.h),
            const SignWithSocial(),
          ],
        ),
      ),
    );
  }
}
