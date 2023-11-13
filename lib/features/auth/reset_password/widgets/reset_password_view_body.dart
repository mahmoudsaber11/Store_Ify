import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var confirmController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    String password = '';
    // ignore: unused_local_variable
    String confirmPassword = '';
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Reset Password",
                style: AppTextStyle.textStyle24Medium,
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Text(
              "Enter your new password ,make sure \n that it should at least 8 characters \n started by _ ",
              style:
                  AppTextStyle.textStyle16Regular.copyWith(color: Colors.grey),
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              "password",
              style: AppTextStyle.textStyle16Regular
                  .copyWith(color: AppColors.primaryColor),
            ),
            CustomTextField(
              isPassword: true,
              onChange: (value) {
                password = value;
              },
              validate: (value) {
                var passNonNullValue = value ?? "";
                if (passNonNullValue.isEmpty) {
                  return ("Password is required");
                } else if (passNonNullValue.length < 8) {
                  return ("Password Must be more than 5 characters");
                }
                return null;
              },
              controller: passwordController,
              inputType: TextInputType.visiblePassword,
              hintText: '*********',
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Confirm password",
              style: AppTextStyle.textStyle16Regular.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            CustomTextField(
              isPassword: true,
              onChange: (value) {
                confirmPassword = value;
              },
              validate: (value) {
                var passNonNullValue = value ?? "";
                if (passNonNullValue.isEmpty) {
                  return ("Password is required");
                } else if (passNonNullValue.length < 6) {
                  return ("Password Must be more than 5 characters");
                } else if (value != password) {
                  return 'Confirm password not matching';
                }
                return null;
              },
              controller: confirmController,
              inputType: TextInputType.visiblePassword,
              hintText: '*********',
            ),
            const SizedBox(
              height: 28,
            ),
            CustomGeneralButton(
                text: 'Reset Password',
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                }),
          ],
        ),
      ),
    );
  }
}
