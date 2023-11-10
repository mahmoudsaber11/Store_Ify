import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/forget_password/forget_password_view.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/cubit/login_cubit.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/cubit/login_state.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/widgets/user_login_form.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/views/sign_up_view.dart';
import 'package:store_ify/Features/views/store_ify_layout/presentation/views/store_ify_layout.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/utils/show_toast.dart';
import 'package:store_ify/core/widgets/general_text.dart';
import 'package:store_ify/core/widgets/sign_with_social.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });
  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is SignInSuccessState) {
        Fluttertoast.showToast(
                msg: state.userModel.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0)
            .then((value) {
          Get.off(() => const StoreIfyLayout());
        });
      }
      if (state is SignInErrorState) {
        showToast(text: state.error, state: ToastStates.ERROR);
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                GeneralText(
                  text: "Sign in to Continue ",
                  color: kTitleColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 5,
                ),
                GeneralText(
                  text: "Welcome ",
                  color: kTitleColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                const SizedBox(
                  height: 22,
                ),
                UserLoginForm(
                    state: state,
                    emailController: emailController,
                    formKey: formKey,
                    passwordController: passwordController),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => const ForgetPasswordView(),
                            //  transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500));
                      },
                      child: const GeneralText(
                        text: "Forget password?",
                        color: Color(0xFFD0CFCE),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Get.off(() => const SignUpView(),
                            //  transition: Transition.rightToLeft,
                            duration: const Duration(milliseconds: 500));
                      },
                      child: GeneralText(
                          text: "Signup ",
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
                GeneralText(
                  text: "Or sign in with",
                  color: kTitleColor,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 24,
                ),
                const SignWithSocial()
              ],
            ),
          ),
        ),
      );
    });
  }
}
