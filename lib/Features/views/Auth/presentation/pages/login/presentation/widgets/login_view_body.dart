import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/forget_password/forget_password_view.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/cubit/login_cubit.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/cubit/login_state.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/widgets/user_login_form.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/views/sign_up_view.dart';
import 'package:store_ify/Features/views/store_ify_layout/presentation/views/store_ify_layout.dart';
import 'package:store_ify/core/utils/show_toast.dart';
import 'package:store_ify/core/widgets/app_text.dart';
import 'package:store_ify/core/widgets/sign_with_social.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is SignInSuccessState) {
        showToast(text: state.userModel.message, state: ToastStates.SUCCESS);
        Get.off(() => const StoreIfyLayout());
      }
      if (state is SignInWithGoogleSuccessState) {
        Get.off(() => const StoreIfyLayout());
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
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              const TextTitleApp(text: "Sign in to Continue "),
              const SizedBox(
                height: 5,
              ),
              const TextTitleApp(text: "Welcome "),
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
                      Get.to(
                        () => const ForgetPasswordView(),
                      );
                    },
                    child: const TextResetAndForgetPassword(
                      text: "Forget password?",
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        () => const SignUpView(),
                      );
                    },
                    child: const TitleTextFieldAndTextButton(text: "Signup "),
                  )
                ],
              ),
              const TextGeneralApp(text: "Or sign in with"),
              const SizedBox(
                height: 24,
              ),
              const SignWithSocial(),
            ],
          ),
        ),
      );
    });
  }
}
