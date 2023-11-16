import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/utils/service_locator.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:store_ify/features/auth/login/presentation/cubit/login_state.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key, required this.email, required this.password});
  final String email;
  final String password;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<LoginCubit>(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 197),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: const Color(0xff0EAA00),
                    borderRadius: BorderRadius.circular(20)),
                child: Image.asset(AppAssets.successResetPassword)),
            const SizedBox(
              height: 19,
            ),
            const Text(
              "Password has been changed successfully",
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle16Medium,
            ),
            const SizedBox(
              height: 55,
            ),
            SizedBox(
              width: 211,
              height: 42,
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return ConditionalBuilder(
                    condition: state is! SignInLoadingState,
                    builder: (context) {
                      return CustomGeneralButton(
                          text: "Log in",
                          onPressed: () {
                            BlocProvider.of<LoginCubit>(context).userSignIn(
                              email: email,
                              password: password,
                            );
                          });
                    },
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
