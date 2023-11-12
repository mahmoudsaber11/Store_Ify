import 'package:flutter/material.dart';
import 'package:store_ify/features/layout/presentation/widgets/store_ify_layout_body.dart';

class StoreIfyLayout extends StatelessWidget {
  const StoreIfyLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StoreIfyLayoutBody(),
    );
  }
}
