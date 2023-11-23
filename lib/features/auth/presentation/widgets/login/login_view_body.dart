import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/features/auth/presentation/widgets/sign_with_social.dart';
import 'package:store_ify/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/login/login_state.dart';
import 'package:store_ify/features/auth/presentation/widgets/login/user_login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) => _handleLoginStates(state, context),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 122),
                const Text(
                  "Sign in to Continue ",
                  style: AppTextStyles.textStyle24Medium,
                ),
                const SizedBox(height: 5),
                const Text(
                  "Welcome ",
                  style: AppTextStyles.textStyle16Medium,
                ),
                const SizedBox(height: 22),
                UserLoginForm(state: state),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => context.navigateTo(
                        routeName: Routes.forgetPasswordRoute,
                      ),
                      child: Text(
                        "Forget password?",
                        style: AppTextStyles.textStyle16Regular
                            .copyWith(color: AppColors.iconsColor),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        context.navigateTo(routeName: Routes.signUpViewRoute);
                      },
                      child: Text(
                        "Sign up ",
                        style: AppTextStyles.textStyle16Regular
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    )
                  ],
                ),
                const Center(
                  child: Text(
                    "Or sign in with",
                    style: AppTextStyles.textStyle16Medium,
                  ),
                ),
                const SizedBox(height: 24),
                const SignWithSocial(),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleLoginStates(LoginState state, BuildContext context) {
    if (state is SignInSuccessState) {
      showToast(text: state.userModel.message, state: ToastStates.SUCCESS);

      context.navigateAndRemoveUntil(
        newRoute: Routes.storeifyLayoutViewRoute,
      );
    }

    if (state is SignInErrorState) {
      showToast(text: state.error, state: ToastStates.ERROR);
    }
  }
}
