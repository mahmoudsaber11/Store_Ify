import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/views/login_view.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/widgets/custom_buttons.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/core/widgets/general_text.dart';
import 'package:store_ify/core/widgets/sign_with_social.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    String password = '';
    // ignore: unused_local_variable
    String confirmPassword = '';

    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GeneralText(
                    text: "Sign Up",
                    color: kTitleColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GeneralText(
                    text: "Create an account",
                    color: kTitleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  GeneralText(
                    text: "E-mail",
                    color: kPrimaryColor,
                    textAlign: TextAlign.start,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  CustomTextField(
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty';
                      } else if (!value.contains('@')) {
                        return "email should contains @";
                      }
                      return null;
                    },
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    hintText: 'Example@gmail.com',
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  GeneralText(
                    text: "Username",
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  CustomTextField(
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty';
                      }
                      if (value.length < 6) {
                        return "must be more than 5 charater";
                      }
                      return null;
                    },
                    controller: nameController,
                    inputType: TextInputType.name,
                    hintText: 'Enter  your username',
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  GeneralText(
                    text: "password",
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                  CustomTextField(
                    isPassword: SignUpCubit.get(context).isPassword,
                    suffix: IconButton(
                        onPressed: () {
                          SignUpCubit.get(context).switchPassVisibility();
                        },
                        icon: Icon(
                          SignUpCubit.get(context).isPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: kPrimaryColor,
                        )),
                    onChange: (value) {
                      password = value;
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
                      }
                      return null;
                    },
                    controller: passwordController,
                    inputType: TextInputType.visiblePassword,
                    hintText: '*********',
                    //  suffix: Icons.visibility_off,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  GeneralText(
                    textAlign: TextAlign.start,
                    text: " Confirm password",
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  CustomTextField(
                    isPassword: SignUpCubit.get(context).isPassword,
                    suffix: IconButton(
                        onPressed: () {
                          SignUpCubit.get(context).switchPassVisibility();
                        },
                        icon: Icon(
                          SignUpCubit.get(context).isPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: kPrimaryColor,
                        )),
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
                    //   suffix: Icons.visibility_off,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomGeneralButton(
                      text: 'Signup',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      }),
                  TextButton(
                      onPressed: () {
                        Get.off(() => const LoginView(),
                            // transition: Transition.leftToRight,
                            duration: const Duration(milliseconds: 500));
                      },
                      child: Row(
                        children: [
                          const Spacer(),
                          GeneralText(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            text: "Login",
                            color: kPrimaryColor,
                          ),
                        ],
                      )),
                  GeneralText(
                    text: "Or sign in with",
                    color: kTitleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const SignWithSocial(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
