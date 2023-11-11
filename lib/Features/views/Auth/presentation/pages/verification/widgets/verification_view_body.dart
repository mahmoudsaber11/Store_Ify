import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/reset%20password/reset_password_view.dart';
import 'package:store_ify/core/utils/assets.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/widgets/custom_buttons.dart';
import 'package:store_ify/core/widgets/general_text.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    OtpFieldController otpController = OtpFieldController();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          GeneralText(
            text: "OTP Verification ",
            color: kTitleColor,
            textAlign: TextAlign.center,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 8,
          ),
          GeneralText(
            text: "We’ve sent a code to XXXXXX",
            color: kSubTitleColor,
            textAlign: TextAlign.center,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(
            height: 19,
          ),
          Image.asset(AssetsData.verification),
          const SizedBox(
            height: 19,
          ),
          GeneralText(
            text: "OTP Code",
            color: kTitleColor,
            textAlign: TextAlign.center,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: OTPTextField(
              otpFieldStyle: OtpFieldStyle(
                focusBorderColor: Colors.red,
                enabledBorderColor: Colors.red,
              ),
              controller: otpController,
              length: 4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 45,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 15,
              style: TextStyle(fontSize: 17, color: kTitleColor),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: CustomGeneralButton(
                text: 'Verify',
                onPressed: () {
                  Get.to(() => const ResetPasswordView(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 500));
                }),
          )
        ],
      ),
    );
  }
}
