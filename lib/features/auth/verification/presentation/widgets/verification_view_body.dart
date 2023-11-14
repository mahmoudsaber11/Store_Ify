import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/features/auth/verification/presentation/cubit/verification_cubit.dart';
import 'package:store_ify/features/auth/verification/presentation/cubit/verification_state.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    OtpFieldController otpController = OtpFieldController();
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        _handleVerificationState(state, context);
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "OTP Verification ",
                    style: AppTextStyles.textStyle24Medium,
                  )),
              const SizedBox(
                height: 8,
              ),
              Text(
                "We’ve sent a code to Example@gmail.com",
                style: AppTextStyles.textStyle16Regular
                    .copyWith(color: AppColors.subTitleColor),
              ),
              const SizedBox(
                height: 19,
              ),
              Image.asset(AppAssets.imagesOtpVerification),
              const SizedBox(
                height: 19,
              ),
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "OTP Code",
                    style: AppTextStyles.textStyle16Medium,
                  )),
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
                  style: const TextStyle(fontSize: 17, color: Colors.black),
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
                      BlocProvider.of<VerificationCubit>(context)
                          .otpVerification(
                              email: otpController.toString(),
                              forgetCode: otpController.toString());
                    }),
              )
            ],
          ),
        );
      },
    );
  }

  void _handleVerificationState(VerificationState state, BuildContext context) {
    if (state is SuccessVerificationState) {
      showToast(text: state.message, state: ToastStates.SUCCESS);
      context.navigateTo(routeName: Routes.resetPasswordViewRoute);
    }
    if (state is ErrorVerificationState) {
      showToast(text: state.errorMessage, state: ToastStates.SUCCESS);
    }
  }
}
