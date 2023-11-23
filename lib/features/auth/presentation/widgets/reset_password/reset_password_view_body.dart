import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/features/auth/presentation/cubits/reset_password/reset_password_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/reset_password/reset_password_state.dart';
import 'package:store_ify/features/auth/presentation/widgets/reset_password/login_dialog.dart';
import 'package:store_ify/features/auth/presentation/widgets/reset_password/reset_password_form.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody(
      {super.key, required this.email, required this.password});
  final String email;
  final String password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        _handleSuccessResetState(state, context, email);
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Reset Password",
                  style: AppTextStyles.textStyle24Medium,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                "Enter your new password ,make sure \n that it should at least 8 characters \n started by _ ",
                style: AppTextStyles.textStyle16Regular
                    .copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 23,
              ),
              const ResetPasswordForm(),
            ],
          ),
        );
      },
    );
  }

  void _handleSuccessResetState(
      ResetPasswordState state, BuildContext context, String email) {
    if (state is SuccessResetPasswordState) {
      showDialog(
          context: context,
          builder: (context) {
            return LoginDialog(
              email: email,
              password: password,
            );
          });
    }
    if (state is ErrorResetPasswordState) {
      showToast(text: state.errorMessage, state: ToastStates.ERROR);
    }
  }
}
