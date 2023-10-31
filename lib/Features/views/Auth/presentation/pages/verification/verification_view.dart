import 'package:flutter/material.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/verification/widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //   backgroundColor: Color(0xFFFFFFFF),
      body: VerificationViewBody(),
    );
  }
}
