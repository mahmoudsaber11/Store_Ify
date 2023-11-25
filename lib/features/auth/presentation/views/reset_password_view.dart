import 'package:flutter/material.dart';
import 'package:store_ify/features/auth/presentation/widgets/reset_password/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPasswordViewBody(email: email),
    );
  }
}
