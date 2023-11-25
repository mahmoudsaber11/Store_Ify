import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_constants.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/sign_up/sign_up_state.dart';
import 'package:store_ify/features/auth/presentation/widgets/or_sign_in_with_text.dart';
import 'package:store_ify/features/auth/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/features/auth/presentation/widgets/sign_with_social.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) => _handleSignUpState(state, context),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: AppConstants.authHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  child: const Text(
                    "Sign Up",
                    style: AppTextStyles.textStyle24Medium,
                  ),
                ),
                SizedBox(height: 5.h),
                const Text(
                  "Create an account",
                  style: AppTextStyles.textStyle16Medium,
                ),
                SizedBox(height: 45.h),
                SignUpForm(state: state),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () => context.getBack(),
                    child: Text(
                      "Login",
                      style: AppTextStyles.textStyle16Regular.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                const OrSignInWithText(),
                SizedBox(height: 24.h),
                const SignWithSocial(),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleSignUpState(SignUpState state, BuildContext context) {
    if (state is SignUpSuccessState) {
      showToast(text: state.userModel.message, state: ToastStates.success);

      context.navigateAndReplacement(newRoute: Routes.storeifyLayoutViewRoute);
    }
    if (state is SignUpErrorState) {
      showToast(text: state.error, state: ToastStates.error);
    }
  }
}
