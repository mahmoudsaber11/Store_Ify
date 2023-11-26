import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_constants.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/auth/presentation/widgets/or_sign_in_with_text.dart';
import 'package:store_ify/features/auth/presentation/widgets/sign_with_social.dart';
import 'package:store_ify/features/auth/presentation/widgets/login/login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: AppConstants.authHorizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 122.h),
              child: Text(
                "Sign in to Continue ",
                style: AppTextStyles.textStyle24Medium,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              "Welcome ",
              style: AppTextStyles.textStyle16Medium,
            ),
            SizedBox(height: 22.h),
            const LoginForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () => context.navigateTo(
                    routeName: Routes.forgetPasswordRoute,
                  ),
                  child: Text(
                    "Forget password?",
                    style: AppTextStyles.textStyle16Regular
                        .copyWith(color: AppColors.iconsColor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.navigateTo(routeName: Routes.signUpViewRoute);
                  },
                  child: Text(
                    "Sign up ",
                    style: AppTextStyles.textStyle16Regular
                        .copyWith(color: AppColors.primaryColor),
                  ),
                )
              ],
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
