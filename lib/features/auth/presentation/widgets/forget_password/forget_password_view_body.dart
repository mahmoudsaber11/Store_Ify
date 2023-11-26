import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_constants.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';

import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/features/auth/presentation/cubits/forget_password/forget_password_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/forget_password/forget_password_state.dart';
import 'package:store_ify/features/auth/presentation/widgets/text_field_label.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final TextEditingController _emailController = TextEditingController();

  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode autoValidateMode;

  void _initFormAttributes() {
    _formKey = GlobalKey<FormState>();
    autoValidateMode = AutovalidateMode.disabled;
  }

  @override
  void initState() {
    _initFormAttributes();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: AppConstants.authHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Forget Password",
                style: AppTextStyles.textStyle24Medium,
              ),
            ),
            SizedBox(height: 30.h),
            const TextFieldLabel(label: 'E-mail'),
            CustomTextField(
              onSubmitted: (_) => _forgetPassword(context),
              validate: (String? value) => Helper.validateEmailField(value),
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Example@gmail.com',
              autofillHints: const [AutofillHints.email],
            ),
            SizedBox(height: 32.h),
            BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                _handleForgetPasswordState(
                    state, context, _emailController.text);
              },
              builder: (context, state) {
                if (state is LoadingCheckEmailState) {
                  return const CustomCircularProgressIndicator();
                } else {
                  return CustomGeneralButton(
                    text: 'Verify Email',
                    onPressed: () => _forgetPassword(context),
                  );
                }
              },
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account ?",
                  style: AppTextStyles.textStyle16Regular,
                ),
                TextButton(
                  onPressed: () =>
                      context.navigateTo(routeName: Routes.signUpViewRoute),
                  child: Text(
                    "Sign up",
                    style: AppTextStyles.textStyle16Regular
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _forgetPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Helper.keyboardUnfocus(context);
      BlocProvider.of<ForgetPasswordCubit>(context)
          .checkEmail(email: _emailController.text);
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  void _handleForgetPasswordState(
    ForgetPasswordState state,
    BuildContext context,
    String email,
  ) {
    if (state is SuccessCheckEmailState) {
      showToast(text: state.message, state: ToastStates.success);
      context.navigateTo(
        routeName: Routes.verificationViewRoute,
        arguments: email,
      );
    }
    if (state is ErrorCheckEmailState) {
      showToast(text: state.errorMessage, state: ToastStates.error);
    }
  }
}
