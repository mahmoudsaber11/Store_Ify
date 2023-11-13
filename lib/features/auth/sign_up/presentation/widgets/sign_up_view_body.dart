import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:store_ify/features/auth/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:store_ify/features/auth/sign_up/presentation/widgets/user_sign_up_form.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/core/widgets/sign_with_social.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String confirmPassword = '';

    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showToast(text: state.userModel.message, state: ToastStates.SUCCESS);

          context.navigateAndReplacement(
            newRoute: Routes.storeifyLayoutViewRoute,
          );
        }
        if (state is SignUpWithGoogleSuccessState) {
          context.navigateAndReplacement(
            newRoute: Routes.storeifyLayoutViewRoute,
          );
        }
        if (state is SignUpErrorState) {
          showToast(text: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Sign Up",
                  style: AppTextStyle.textStyle24Medium,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Create an account",
                  style: AppTextStyle.textStyle16Medium,
                ),
                const SizedBox(
                  height: 22,
                ),
                UserSignUpForm(state: state),
                TextButton(
                    onPressed: () {
                      context.navigateTo(routeName: Routes.loginViewRoute);
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              context.navigateTo(
                                  routeName: Routes.loginViewRoute);
                            },
                            child: Text(
                              "Login",
                              style: AppTextStyle.textStyle16Regular.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            )),
                      ],
                    )),
                const Center(
                    child: Text(
                  "Or sign in with",
                  style: AppTextStyle.textStyle16Medium,
                )),
                const SizedBox(
                  height: 24,
                ),
                SignWithSocial(
                  onTap: () {
                    SignUpCubit.get(context).signUpWithGoogle();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
