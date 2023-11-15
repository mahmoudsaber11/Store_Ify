import 'package:flutter/material.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/features/auth/reset_password/widgets/dialog_succes_password.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String password = '';
  // ignore: unused_local_variable
  String confirmPassword = '';

  @override
  void dispose() {
    super.dispose();
    _disposeController();
  }

  void _disposeController() {
    passwordController.dispose();
    confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "password",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          CustomTextField(
            isPassword: true,
            onChange: (value) {
              password = value;
            },
            validate: (value) => Helper.validatePasswordField(value),
            controller: passwordController,
            inputType: TextInputType.visiblePassword,
            hintText: '*********',
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Confirm password",
            style: AppTextStyles.textStyle16Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          CustomTextField(
            isPassword: true,
            onChange: (value) {
              confirmPassword = value;
            },
            validate: (value) =>
                Helper.validateConfirmPasswordField(value, password),
            controller: confirmController,
            inputType: TextInputType.visiblePassword,
            hintText: '*********',
          ),
          const SizedBox(
            height: 28,
          ),
          CustomGeneralButton(
              text: 'Reset Password',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return const DialogSuccesPassword();
                      });
                }
              }),
        ],
      ),
    );
  }
}
