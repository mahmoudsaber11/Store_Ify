import 'package:flutter/material.dart';
import 'package:store_ify/features/auth/verification/presentation/widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VerificationViewBody(),
    );
  }
}
