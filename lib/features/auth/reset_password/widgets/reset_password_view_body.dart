import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/auth/reset_password/widgets/reset_password_form.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Reset Password",
              style: AppTextStyles.textStyle24Medium,
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            "Enter your new password ,make sure \n that it should at least 8 characters \n started by _ ",
            style:
                AppTextStyles.textStyle16Regular.copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 23,
          ),
          const ResetPasswordForm(),
        ],
      ),
    );
  }
}
