import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:store_ify/features/auth/login/presentation/cubit/login_state.dart';
<<<<<<< HEAD
import 'package:store_ify/core/widgets/custom_buttons.dart';
=======
import 'package:store_ify/core/widgets/app_text.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
>>>>>>> 2cd3f08924f7a22590fccbac82ea9449784c1542
import 'package:store_ify/core/widgets/custom_text_field.dart';

class UserLoginForm extends StatefulWidget {
  const UserLoginForm({
    super.key,
    required this.state,
  });
  final LoginState state;

  @override
  State<UserLoginForm> createState() => _UserLoginFormState();
}

class _UserLoginFormState extends State<UserLoginForm> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    disposeController();
  }

  void disposeController() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "E-mail",
            style: AppTextStyle.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          CustomTextField(
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'email must not be empty';
              }
              if (!value.contains('@')) {
                return "email should contains @";
              }
              return null;
            },
            controller: emailController,
            inputType: TextInputType.emailAddress,
            hintText: 'Example@gmail.com',
          ),
          const SizedBox(
            height: 38,
          ),
          Text(
            "password",
            style: AppTextStyle.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          CustomTextField(
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'Please enter password';
              } else {
                return null;
              }
            },
            onSubmitted: (value) {
              if (formKey.currentState!.validate()) {
                LoginCubit.get(context).userSignIn(
                    email: emailController.text,
                    password: passwordController.text);
              }
            },
            controller: passwordController,
            inputType: TextInputType.visiblePassword,
            hintText: '*********',
            isPassword: LoginCubit.get(context).isPassword,
            suffix: IconButton(
              onPressed: () {
                LoginCubit.get(context).changePasswordVisibility();
              },
              icon: Icon(
                LoginCubit.get(context).isPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ConditionalBuilder(
            condition: widget.state is! SignInLoadingState,
            builder: (context) {
              return CustomGeneralButton(
                  text: 'Log in',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      LoginCubit.get(context).userSignIn(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  });
            },
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
