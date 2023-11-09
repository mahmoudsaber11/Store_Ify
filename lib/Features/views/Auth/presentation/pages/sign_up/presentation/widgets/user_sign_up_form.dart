import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/widgets/custom_buttons.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/core/widgets/general_text.dart';

class UserSignUpForm extends StatelessWidget {
  const UserSignUpForm({
    super.key,
    required this.emailController,
    required this.nameController,
    required this.passwordController,
    required this.formKey,
    required this.confirmController,
    required this.password,
    required this.state,
  });

  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final TextEditingController confirmController;
  final String password;
  final SignUpState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          validate: (value) {
            var passNonNullValue = value ?? "";
            if (passNonNullValue.isEmpty) {
              return ("Password is required");
            } else if (passNonNullValue.length < 6) {
              return ("Password Must be more than 5 characters");
            }
            return null;
          },
          controller: passwordController,
          inputType: TextInputType.visiblePassword,
          hintText: '*********',
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
          onSubmited: (value) {
            if (formKey.currentState!.validate()) {
              SignUpCubit.get(context).userSignUP(
                userName: nameController.text,
                email: emailController.text,
                password: passwordController.text,
                confirmPassword: confirmController.text,
              );
            }
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
          height: 32,
        ),
        ConditionalBuilder(
          condition: state is! SignUpLoadingState,
          builder: (context) {
            return CustomGeneralButton(
                text: 'Signup',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    SignUpCubit.get(context).userSignUP(
                      userName: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      confirmPassword: confirmController.text,
                    );
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
