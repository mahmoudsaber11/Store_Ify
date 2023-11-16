import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/features/auth/verification/presentation/cubit/verification_cubit.dart';

class VerificationForm extends StatefulWidget {
  const VerificationForm({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<VerificationForm> createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  TextEditingController otpController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Pinput(
                controller: otpController,
                focusNode: focusNode,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: pinTheme(),
                separatorBuilder: (index) => const SizedBox(width: 34),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Pin Is Empty";
                  }
                  return null;
                },
              )),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: CustomGeneralButton(
                text: 'Verify',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<VerificationCubit>(context).otpVerification(
                        email: widget.email,
                        forgetCode: otpController.toString());
                  }
                }),
          ),
        ],
      ),
    );
  }

  PinTheme pinTheme() {
    return PinTheme(
      width: 56,
      height: 52,
      textStyle: const TextStyle(
        fontSize: 22,
        color: AppColors.textProfileColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.primaryColor),
      ),
    );
  }
}
