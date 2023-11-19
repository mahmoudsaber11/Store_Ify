import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/features/auth/verification/presentation/cubit/verification_cubit.dart';
import 'package:store_ify/features/auth/verification/presentation/cubit/verification_state.dart';
import 'package:store_ify/features/auth/verification/presentation/widgets/verification_form.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) {
        _handleVerificationState(state, context, email);
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
              VerificationForm(email: email)
            ],
          ),
        );
      },
    );
  }

  PinTheme pinTheme() {
    return PinTheme(
      width: 56,
      height: 52,
      textStyle: const TextStyle(
        fontSize: 22,
        color: AppColors.textColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.primaryColor),
      ),
    );
  }

  void _handleVerificationState(
      VerificationState state, BuildContext context, String email) {
    if (state is SuccessVerificationState) {
      showToast(text: state.message, state: ToastStates.SUCCESS);
      context.navigateTo(
          routeName: Routes.resetPasswordViewRoute, arguments: email);
    }
    if (state is ErrorVerificationState) {
      showToast(text: state.errorMessage, state: ToastStates.ERROR);
    }
  }
}
