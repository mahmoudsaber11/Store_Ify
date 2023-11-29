import 'package:flutter/material.dart';
import 'package:store_ify/core/widgets/action_appbar.dart';
import 'package:store_ify/features/product_details/presentation/widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: const [
          ActionAppBar(),
        ],
      ),
      body: const ProductDetailsViewBody(),
    );
  }
}
