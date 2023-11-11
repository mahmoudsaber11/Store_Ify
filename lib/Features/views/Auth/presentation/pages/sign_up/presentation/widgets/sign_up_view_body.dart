import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/views/login_view.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/widgets/user_sign_up_form.dart';
import 'package:store_ify/Features/views/store_ify_layout/presentation/views/store_ify_layout.dart';
import 'package:store_ify/core/utils/show_toast.dart';
import 'package:store_ify/core/widgets/app_text.dart';
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

          Get.off(() => const StoreIfyLayout());
        }
        if (state is SignUpWithGoogleSuccessState) {
          Get.off(() => const StoreIfyLayout());
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
                const TextTitleApp(text: "Sign Up"),
                const SizedBox(
                  height: 5,
                ),
                const TextGeneralApp(text: "Create an account"),
                const SizedBox(
                  height: 22,
                ),
                UserSignUpForm(state: state),
                TextButton(
                    onPressed: () {
                      Get.off(
                        () => const LoginView(),
                      );
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const LoginView());
                          },
                          child:
                              const TitleTextFieldAndTextButton(text: "Login"),
                        ),
                      ],
                    )),
                const Center(child: TextGeneralApp(text: "Or sign in with")),
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
