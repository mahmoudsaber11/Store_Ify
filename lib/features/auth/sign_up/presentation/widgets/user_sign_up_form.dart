import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:store_ify/features/auth/sign_up/presentation/cubit/sign_up_state.dart';

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
    var cubit = BlocProvider.of<SignUpCubit>(context);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "E-mail",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(
            height: 9,
          ),
          CustomTextField(
            validate: (String? value) => Helper.validateEmailField(value),
            controller: emailController,
            inputType: TextInputType.emailAddress,
            hintText: 'Example@gmail.com',
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Username",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(
            height: 9,
          ),
          CustomTextField(
            validate: (String? value) => Helper.validateUserNameField(value),
            controller: nameController,
            inputType: TextInputType.name,
            hintText: 'Enter  your username',
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "password",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(
            height: 9,
          ),
          CustomTextField(
            isPassword: cubit.isPassword,
            suffix: IconButton(
                onPressed: () {
                  cubit.switchPassVisibility();
                },
                icon: Icon(
                  cubit.isPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.primaryColor,
                )),
            validate: (value) => Helper.validatePasswordField(value),
            controller: passwordController,
            inputType: TextInputType.visiblePassword,
            hintText: '*********',
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Confirm password",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(
            height: 9,
          ),
          CustomTextField(
            isPassword: cubit.isPassword,
            suffix: IconButton(
                onPressed: () {
                  cubit.switchPassVisibility();
                },
                icon: Icon(
                  cubit.isPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.primaryColor,
                )),
            onSubmitted: (_) {
              _signUp();
            },
            validate: (value) => Helper.validateConfirmPasswordField(value),
            controller: confirmController,
            inputType: TextInputType.visiblePassword,
            hintText: '*********',
          ),
          const SizedBox(
            height: 24,
          ),
          ConditionalBuilder(
            condition: widget.state is! SignUpLoadingState,
            builder: (context) {
              return CustomGeneralButton(
                  text: 'Sign up',
                  onPressed: () {
                    _signUp();
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

  void _signUp() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<SignUpCubit>(context).userSignUP(
        userName: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmController.text,
      );
    }
  }
}
