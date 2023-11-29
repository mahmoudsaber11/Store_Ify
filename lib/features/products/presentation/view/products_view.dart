import 'package:flutter/material.dart';
import 'package:store_ify/core/widgets/action_appbar.dart';

import 'package:store_ify/features/products/presentation/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: const [
          ActionAppBar(),
        ],
      ),
      body: const ProductsViewBody(),
    );
  }
}
