import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/views/login_view.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/cubit/sign_up_state.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/widgets/user_sign_up_form.dart';
import 'package:store_ify/Features/views/store_ify_layout/presentation/views/store_ify_layout.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/utils/show_toast.dart';
import 'package:store_ify/core/widgets/general_text.dart';
import 'package:store_ify/core/widgets/sign_with_social.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    String password = '';
    // ignore: unused_local_variable
    String confirmPassword = '';

    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
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
        if (state is SignUpErrorState) {
          showToast(text: state.error, state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GeneralText(
                    text: "Sign Up",
                    color: kTitleColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GeneralText(
                    text: "Create an account",
                    color: kTitleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  UserSignUpForm(
                      emailController: emailController,
                      nameController: nameController,
                      passwordController: passwordController,
                      formKey: formKey,
                      confirmController: confirmController,
                      password: password,
                      state: state),
                  TextButton(
                      onPressed: () {
                        Get.off(() => const LoginView(),
                            // transition: Transition.leftToRight,
                            duration: const Duration(milliseconds: 500));
                      },
                      child: Row(
                        children: [
                          const Spacer(),
                          GeneralText(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            text: "Login",
                            color: kPrimaryColor,
                          ),
                        ],
                      )),
                  GeneralText(
                    text: "Or sign in with",
                    color: kTitleColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const SignWithSocial(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
