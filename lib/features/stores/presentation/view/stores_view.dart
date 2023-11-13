import 'package:flutter/material.dart';
import 'package:store_ify/features/stores/presentation/widgets/stores_view_body.dart';

class StoresView extends StatelessWidget {
  const StoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StoresViewBody(),
    );
  }
}
