import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/core/widgets/app_text.dart';
import 'package:store_ify/core/widgets/sign_with_social.dart';
import 'package:store_ify/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:store_ify/features/auth/login/presentation/cubit/login_state.dart';
import 'package:store_ify/features/auth/login/presentation/widgets/user_login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is SignInSuccessState) {
        showToast(text: state.userModel.message, state: ToastStates.SUCCESS);
        context.navigateAndReplacement(
          newRoute: Routes.storeifyLayoutViewRoute,
        );
      }
      if (state is SignInWithGoogleSuccessState) {
        context.navigateAndReplacement(
          newRoute: Routes.storeifyLayoutViewRoute,
        );
      }
      if (state is SignInErrorState) {
        showToast(text: state.error, state: ToastStates.ERROR);
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 122,
              ),
              const TextTitleApp(text: "Sign in to Continue "),
              const SizedBox(
                height: 5,
              ),
              const TextGeneralApp(text: "Welcome "),
              const SizedBox(
                height: 22,
              ),
              UserLoginForm(
                state: state,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      context.navigateTo(routeName: Routes.forgetPasswordRoute);
                    },
                    child: const TextResetAndForgetPassword(
                      text: "Forget password?",
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      context.navigateTo(routeName: Routes.signUpViewRoute);
                    },
                    child: const TitleTextFieldAndTextButton(text: "Sign up "),
                  )
                ],
              ),
              const Center(child: TextGeneralApp(text: "Or sign in with")),
              const SizedBox(
                height: 24,
              ),
              SignWithSocial(
                onTap: () {
                  LoginCubit.get(context).signInWithGoogle();
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
