import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/views/sign_up_view.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/verification/verification_view.dart';
import 'package:store_ify/core/widgets/app_text.dart';
import 'package:store_ify/core/widgets/custom_buttons.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: TextTitleApp(text: "Forget Password"),
            ),
            const SizedBox(
              height: 30,
            ),
            const TitleTextFieldAndTextButton(text: "E-mail"),
            CustomTextField(
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
            CustomGeneralButton(
                text: 'Verfiy Email',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Get.to(() => const VerificationView(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(milliseconds: 500));
                  }
                }),
            const SizedBox(
              height: 23,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextGeneralApp(text: "Don’t have an account ? "),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => const SignUpView(),
                    );
                  },
                  child: const TitleTextFieldAndTextButton(text: "Signup "),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
