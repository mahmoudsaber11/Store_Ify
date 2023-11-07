import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/forget_password/forget_password_view.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/cubit/login_cubit.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/cubit/login_state.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/views/sign_up_view.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/widgets/custom_buttons.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/core/widgets/general_text.dart';
import 'package:store_ify/core/widgets/sign_with_social.dart';
import 'package:store_ify/main.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                GeneralText(
                  text: "Sign in to Continue ",
                  color: kTitleColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 5,
                ),
                GeneralText(
                  text: "Welcome ",
                  color: kTitleColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 22,
                ),
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
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
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
                CustomGeneralButton(
                    text: 'Log in',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    }),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => const ForgetPasswordView(),
                            //  transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500));
                      },
                      child: const GeneralText(
                        text: "Forget password?",
                        color: Color(0xFFD0CFCE),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.off(() => const SignUpView(),
                            //  transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500));
                      },
                      child: GeneralText(
                          text: "Signup ",
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
                GeneralText(
                  text: "Or sign in with",
                  color: kTitleColor,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 24,
                ),
                const SignWithSocial()
              ],
            ),
          ),
        ),
      );
    });
  }
}
