import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/features/auth/presentation/cubits/reset_password/reset_password_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/reset_password/reset_password_state.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  late final GlobalKey<FormState> _formKey;
  late final AutovalidateMode autovalidateMode;
  String password = '';
  // ignore: unused_local_variable
  String confirmPassword = '';

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
    _disposeController();

    _disposeFocusNodes();
  }

  void _disposeController() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  void _disposeFocusNodes() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: '*********',
            autofillHints: const <String>[AutofillHints.password],
            focusNode: _passwordFocusNode,
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
          ),
          SizedBox(
            height: 50.h,
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
            validate: (value) => Helper.validateConfirmPasswordField(
              value: value,
              password: _passwordController.text,
              confirmPassword: confirmPassword,
            ),
            controller: _confirmController,
            keyboardType: TextInputType.visiblePassword,
            hintText: '*********',
            onSubmitted: (_) => resetPassword(context),
            autofillHints: const <String>[AutofillHints.password],
            focusNode: _confirmPasswordFocusNode,
          ),
          SizedBox(
            height: 28.h,
          ),
          BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
            builder: (context, state) {
              if (state is LoadingResetPasswordState) {
                return const CustomCircularProgressIndicator();
              } else {
                return CustomGeneralButton(
                    text: 'Reset Password',
                    onPressed: () => resetPassword(context));
              }
            },
          ),
        ],
      ),
    );
  }

  void resetPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Helper.keyboardUnfocus(context);
      BlocProvider.of<ResetPasswordCubit>(context).resetPassword(
          email: _emailController.text,
          password: _passwordController.text,
          confirmPassword: _confirmController.text);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
