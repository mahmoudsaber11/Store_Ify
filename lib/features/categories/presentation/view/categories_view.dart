import 'package:flutter/material.dart';
import 'package:store_ify/core/widgets/action_appbar.dart';
import 'package:store_ify/features/categories/presentation/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: const [
          ActionAppBar(),
        ],
      ),
      body: const CategoriesViewBody(),
    );
  }
}
