import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';

import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:store_ify/features/auth/forget_password/presentation/cubit/forget_password_state.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is SuccessCheckEmailState) {
          showToast(text: state.message, state: ToastStates.SUCCESS);
          context.navigateTo(routeName: Routes.verificationViewRoute);
        }
        if (state is ErrorCheckEmailState) {
          showToast(text: state.errorMessage, state: ToastStates.ERROR);
        }
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
                  onSubmitted: (value) {
                    if (formKey.currentState!.validate()) {
                      ForgetPasswordCubit.get(context)
                          .checkEmail(email: emailController.text);
                    }
                  },
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'email must not be empty';
                    }
                    if (!value.contains('@')) {
                      return "email should contains @";
                    }
                    return null;
                  },
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
                          if (formKey.currentState!.validate()) {
                            ForgetPasswordCubit.get(context)
                                .checkEmail(email: emailController.text);
                          }
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
}
