import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/sign_up/sign_up_state.dart';

import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/features/auth/presentation/widgets/text_field_label.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

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

    _disposeControllers();

    _disposeFocusNodes();
  }

  void _disposeFocusNodes() {
    _emailFocusNode.dispose();
    _nameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
  }

  void _disposeControllers() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SignUpCubit>(context);

    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldLabel(label: 'Email'),
          SizedBox(height: 9.h),
          CustomTextField(
            validate: (String? value) => Helper.validateEmailField(value),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Example@gmail.com',
            autofillHints: const <String>[AutofillHints.email],
            focusNode: _emailFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_nameFocusNode),
          ),
          SizedBox(height: 24.h),
          const TextFieldLabel(label: 'Username'),
          SizedBox(height: 9.h),
          CustomTextField(
            validate: (String? value) => Helper.validateUserNameField(value),
            controller: _nameController,
            keyboardType: TextInputType.name,
            hintText: 'Enter your username',
            autofillHints: const <String>[AutofillHints.name],
            focusNode: _nameFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_passwordFocusNode),
          ),
          SizedBox(height: 24.h),
          const TextFieldLabel(label: 'password'),
          SizedBox(height: 9.h),
          CustomTextField(
            isPassword: cubit.isPassword,
            suffix: IconButton(
              onPressed: () => cubit.switchPassVisibility(),
              icon: Icon(
                cubit.isPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.primaryColor,
              ),
            ),
            validate: (value) => Helper.validatePasswordField(value),
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: '*********',
            autofillHints: const <String>[AutofillHints.password],
            focusNode: _passwordFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
          ),
          SizedBox(height: 24.h),
          const TextFieldLabel(label: 'Confirm password'),
          SizedBox(height: 9.h),
          CustomTextField(
            isPassword: cubit.isPassword,
            suffix: IconButton(
              onPressed: () => cubit.switchPassVisibility(),
              icon: Icon(
                cubit.isPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.primaryColor,
              ),
            ),
            onSubmitted: (_) => _signUp(context),
            validate: (value) => Helper.validateConfirmPasswordField(
              value: value,
              password: _passwordController.text,
              confirmPassword: _confirmController.text,
            ),
            controller: _confirmController,
            keyboardType: TextInputType.visiblePassword,
            hintText: '*********',
            autofillHints: const <String>[AutofillHints.password],
            focusNode: _confirmPasswordFocusNode,
          ),
          SizedBox(height: 24.h),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              if (state is SignUpLoadingState) {
                return const CustomCircularProgressIndicator();
              } else {
                return CustomGeneralButton(
                  text: 'Sign up',
                  onPressed: () => _signUp(context),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Helper.keyboardUnfocus(context);
      BlocProvider.of<SignUpCubit>(context).userSignUP(
        userName: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmController.text,
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
