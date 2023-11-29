import 'package:flutter/material.dart';
import 'package:store_ify/features/auth/presentation/widgets/forget_password/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: ForgetPasswordViewBody(),
    );
  }
}
