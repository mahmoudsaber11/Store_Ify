import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/sign_up/sign_up_state.dart';

import 'package:store_ify/core/widgets/custom_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.state,
  });

  final SignUpState state;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode autovalidateMode;
  void _initFormAttributes() {
    _formKey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  void initState() {
    _initFormAttributes();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    disposeControllers();

    _disposeFocusNodes();
  }

  void _disposeFocusNodes() {
    _emailFocusNode.dispose();
    _nameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
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
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "E-mail",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(
            height: 9.h,
          ),
          CustomTextField(
            validate: (String? value) => Helper.validateEmailField(value),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Example@gmail.com',
            autofillHints: const <String>[AutofillHints.email],
            focusNode: _emailFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_nameFocusNode),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            "Username",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(
            height: 9.h,
          ),
          CustomTextField(
            validate: (String? value) => Helper.validateUserNameField(value),
            controller: nameController,
            keyboardType: TextInputType.name,
            hintText: 'Enter  your username',
            autofillHints: const <String>[AutofillHints.name],
            focusNode: _nameFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_passwordFocusNode),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            "password",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(
            height: 9.h,
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
            keyboardType: TextInputType.visiblePassword,
            hintText: '*********',
            autofillHints: const <String>[AutofillHints.password],
            focusNode: _passwordFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            "Confirm password",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(
            height: 9.h,
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
            validate: (value) => Helper.validateConfirmPasswordField(
              value: value,
              password: passwordController.text,
              confirmPassword: confirmController.text,
            ),
            controller: confirmController,
            keyboardType: TextInputType.visiblePassword,
            hintText: '*********',
            autofillHints: const <String>[AutofillHints.password],
            focusNode: _confirmPasswordFocusNode,
          ),
          SizedBox(
            height: 24.h,
          ),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              if (state is SignUpLoadingState) {
                return const CustomCircularProgressIndicator();
              } else {
                return CustomGeneralButton(
                    text: 'Sign up',
                    onPressed: () {
                      _signUp();
                    });
              }
            },
          ),
        ],
      ),
    );
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Helper.keyboardUnfocus(context);
      BlocProvider.of<SignUpCubit>(context).userSignUP(
        userName: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmController.text,
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
