import 'package:flutter/material.dart';
import 'package:store_ify/features/auth/verification/presentation/widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerificationViewBody(
        email: email,
      ),
    );
  }
}
