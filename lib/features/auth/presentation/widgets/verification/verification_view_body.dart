import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/features/auth/presentation/cubits/verification/verification_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/verification/verification_state.dart';
import 'package:store_ify/features/auth/presentation/widgets/verification/verification_form.dart';

class VerificationViewBody extends StatelessWidget {
  const VerificationViewBody({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerificationCubit, VerificationState>(
      listener: (context, state) =>
          _handleVerificationState(state, context, email),
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "OTP Verification ",
                style: AppTextStyles.textStyle24Medium,
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Text(
                "We’ve sent a code to $email",
                style: AppTextStyles.textStyle16Regular
                    .copyWith(color: AppColors.subTitleColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 19.h),
            Image.asset(AppAssets.imagesOtpVerification),
            SizedBox(height: 19.h),
            const Center(
              child: Text(
                "OTP Code",
                style: AppTextStyles.textStyle16Medium,
              ),
            ),
            SizedBox(height: 13.h),
            VerificationForm(email: email),
            const Spacer(),
          ],
        );
      },
    );
  }

  void _handleVerificationState(
      VerificationState state, BuildContext context, String email) {
    if (state is SuccessVerificationState) {
      showToast(text: state.message, state: ToastStates.success);
      context.navigateTo(
        routeName: Routes.resetPasswordViewRoute,
        arguments: email,
      );
    }
    if (state is ErrorVerificationState) {
      showToast(text: state.errorMessage, state: ToastStates.error);
    }
  }
}
