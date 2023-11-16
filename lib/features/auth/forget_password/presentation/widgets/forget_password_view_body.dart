import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';

import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:store_ify/features/auth/forget_password/presentation/cubit/forget_password_state.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        _handleForgetPasswordState(state, context, emailController.text);
      },
      builder: (context, state) {
        return Form(
          key: formKey,
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
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "E-mail",
                  style: AppTextStyles.textStyle16Regular,
                ),
                CustomTextField(
                  onSubmitted: (_) {
                    _foregtPassword();
                  },
                  validate: (String? value) => Helper.validateEmailField(value),
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  hintText: 'Example@gmail.com',
                ),
                const SizedBox(
                  height: 32,
                ),
                ConditionalBuilder(
                  condition: state is! LoadingCheckEmailState,
                  builder: (context) {
                    return CustomGeneralButton(
                        text: 'Verify Email',
                        onPressed: () {
                          _foregtPassword();
                        });
                  },
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                const SizedBox(
                  height: 23,
                ),
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
                      child: const Text(
                        "Sign up ",
                        style: AppTextStyles.textStyle16Regular,
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

  void _foregtPassword() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<ForgetPasswordCubit>(context)
          .checkEmail(email: emailController.text);
    }
  }

  void _handleForgetPasswordState(
      ForgetPasswordState state, BuildContext context, String email) {
    if (state is SuccessCheckEmailState) {
      showToast(text: state.message, state: ToastStates.SUCCESS);
      context.navigateTo(
          routeName: Routes.verificationViewRoute, arguments: email);
    }
    if (state is ErrorCheckEmailState) {
      showToast(text: state.errorMessage, state: ToastStates.ERROR);
    }
  }
}
