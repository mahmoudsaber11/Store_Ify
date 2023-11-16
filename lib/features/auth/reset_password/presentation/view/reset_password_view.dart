import 'package:flutter/material.dart';
import 'package:store_ify/features/auth/reset_password/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView(
      {super.key, required this.email, required this.password});
  final String email;
  final String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPasswordViewBody(
        email: email,
        password: password,
      ),
    );
  }
}
