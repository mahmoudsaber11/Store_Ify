import 'package:flutter/material.dart';
import 'package:store_ify/core/widgets/app_text.dart';
import 'package:store_ify/core/widgets/custom_buttons.dart';
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
            const TextTitleApp(text: "Reset Password"),
            const SizedBox(
              height: 13,
            ),
            const TextResetAndForgetPassword(
              text:
                  "Enter your new password ,make sure that it should at least 8 characters started by _ ",
            ),
            const SizedBox(
              height: 23,
            ),
            const TitleTextFieldAndTextButton(text: "password"),
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
            const TitleTextFieldAndTextButton(text: "Confirm password"),
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
