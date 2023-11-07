import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/widgets/custom_buttons.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/core/widgets/general_text.dart';

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
            GeneralText(
              text: "Reset Password",
              color: kTitleColor,
              textAlign: TextAlign.center,
              fontSize: 22.5,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 13,
            ),
            const GeneralText(
              text:
                  "Enter your new password ,make sure that it should at least 8 characters started by _ ",
              color: Color(0xFFD0CFCE),
              textAlign: TextAlign.center,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 23,
            ),
            GeneralText(
              text: "password",
              color: kPrimaryColor,
              textAlign: TextAlign.start,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            CustomTextField(
              isPassword: true,
              onChange: (value) {
                password = value;
              },
              validate: (value) {
                RegExp regex = RegExp(
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                var passNonNullValue = value ?? "";
                if (passNonNullValue.isEmpty) {
                  return ("Password is required");
                } else if (passNonNullValue.length < 8) {
                  return ("Password Must be more than 5 characters");
                } else if (!regex.hasMatch(passNonNullValue)) {
                  return ("Password should contain upper,lower,digit and Special character ");
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
            
                GeneralText(
                  text: " Confirm password",
                  color: kPrimaryColor,
                  textAlign: TextAlign.start,
                  fontSize: 16,
                ),
                CustomTextField(
                  isPassword: true,
                  onChange: (value) {
                    confirmPassword = value;
                  },
                  validate: (value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    var passNonNullValue = value ?? "";
                    if (passNonNullValue.isEmpty) {
                      return ("Password is required");
                    } else if (passNonNullValue.length < 6) {
                      return ("Password Must be more than 5 characters");
                    } else if (!regex.hasMatch(passNonNullValue)) {
                      return ("Password should contain upper,lower,digit and Special character ");
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
