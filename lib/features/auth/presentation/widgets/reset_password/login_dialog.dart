import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/core/utils/service_locator.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/login/login_state.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({
    super.key,
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<LoginCubit>(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 13.w, vertical: 197.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: const Color(0xff0EAA00),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Image.asset(AppAssets.successResetPassword),
            ),
            SizedBox(height: 19.h),
            Text(
              "Password has been changed successfully",
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle16Medium,
            ),
            SizedBox(height: 55.h),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return const CustomCircularProgressIndicator();
                } else {
                  return CustomGeneralButton(
                    width: 211.w,
                    text: "Log in",
                    onPressed: () {
                      BlocProvider.of<LoginCubit>(context).userSignIn(
                        email: email,
                        password: password,
                      );
                    },
                  );
                }
              },

            )
          ],
        ),
      ),
    );
  }
}

void _handleLoginStates(LoginState state, BuildContext context) {
  if (state is SignInSuccessState) {
    showToast(text: state.userModel.message, state: ToastStates.success);
    context.navigateAndReplacement(newRoute: Routes.storeifyLayoutViewRoute);
  }

  if (state is SignInErrorState) {
    showToast(text: state.error, state: ToastStates.error);
  }
}
