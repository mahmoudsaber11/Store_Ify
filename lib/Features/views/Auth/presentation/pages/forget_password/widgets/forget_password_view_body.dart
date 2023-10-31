import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/verification/verification_view.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/widgets/custom_buttons.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/core/widgets/general_text.dart';

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
            Center(
              child: GeneralText(
                text: "Forget Password",
                color: kTitleColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GeneralText(
              text: "E-mail",
              color: kPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
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
                GeneralText(
                  text: "Don’t have an account ? ",
                  color: kTitleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                InkWell(
                  onTap: () {},
                  child: GeneralText(
                    text: "Signup ",
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
