import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';

import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/features/auth/presentation/cubits/forget_password/forget_password_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/forget_password/forget_password_state.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final TextEditingController _emailController = TextEditingController();

  late final GlobalKey<FormState> _formKey;
  late final AutovalidateMode autoValidateMode;

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
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        _handleForgetPasswordState(state, context, _emailController.text);
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    "Forget Password",
                    style: AppTextStyles.textStyle24Medium,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "E-mail",
                  style: AppTextStyles.textStyle16Regular
                      .copyWith(color: AppColors.primaryColor),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  onSubmitted: (_) => _forgetPassword(),
                  validate: (String? value) => Helper.validateEmailField(value),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Example@gmail.com',
                ),
                const SizedBox(height: 32),
                ConditionalBuilder(
                  condition: state is! LoadingCheckEmailState,
                  builder: (context) {
                    return CustomGeneralButton(
                      text: 'Verify Email',
                      onPressed: () => _forgetPassword(),
                    );
                  },
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                const SizedBox(height: 23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account ? ",
                      style: AppTextStyles.textStyle16Regular,
                    ),
                    InkWell(
                      onTap: () {
                        context.navigateTo(routeName: Routes.signUpViewRoute);
                      },
                      child: Text(
                        "Sign up ",
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
      },
    );
  }

  void _forgetPassword() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
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
