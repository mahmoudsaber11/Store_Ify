import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/cubit/login_cubit.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/cubit/login_state.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/widgets/custom_buttons.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/core/widgets/general_text.dart';

class UserLoginForm extends StatelessWidget {
  const UserLoginForm(
      {super.key,
      required this.emailController,
      required this.formKey,
      required this.passwordController,
      required this.state});

  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final LoginState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GeneralText(
          text: "E-mail",
          color: kPrimaryColor,
          fontSize: 16,
          textAlign: TextAlign.start,
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
        GeneralText(
          text: "password",
          color: kPrimaryColor,
          textAlign: TextAlign.start,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        CustomTextField(
          validate: (String? value) {
            // RegExp regex = RegExp(
            //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
            if (value!.isEmpty) {
              return 'Please enter password';
            }
            // else {
            //  if (!regex.hasMatch(value)) {
            //   return 'Enter valid password';
            //   }
            else {
              return null;
              // }
            }
          },
          onSubmited: (value) {
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
                color: kPrimaryColor,
              )),
        ),
        const SizedBox(
          height: 32,
        ),
        ConditionalBuilder(
          condition: state is! SignInLoadingState,
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
          fallback: (context) => Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
