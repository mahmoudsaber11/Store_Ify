import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:store_ify/features/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:store_ify/core/widgets/app_text.dart';
import 'package:store_ify/core/widgets/custom_buttons.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';

class UserSignUpForm extends StatefulWidget {
  const UserSignUpForm({
    super.key,
    required this.state,
  });

  final SignUpState state;

  @override
  State<UserSignUpForm> createState() => _UserSignUpFormState();
}

class _UserSignUpFormState extends State<UserSignUpForm> {
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String password = '';
  // ignore: unused_local_variable
  String confirmPassword = '';

  @override
  void dispose() {
    super.dispose();

    disposeControllers();
  }

  void disposeControllers() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TitleTextFieldAndTextButton(text: "E-mail"),
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
          const TitleTextFieldAndTextButton(text: "Username"),
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
          const TitleTextFieldAndTextButton(text: "password"),
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
                  color: AppColors.primaryColor,
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
          const TitleTextFieldAndTextButton(text: " Confirm password"),
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
                  color: AppColors.primaryColor,
                )),
            onSubmitted: (value) {
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
            condition: widget.state is! SignUpLoadingState,
            builder: (context) {
              return CustomGeneralButton(
                  text: 'Sign up',
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
