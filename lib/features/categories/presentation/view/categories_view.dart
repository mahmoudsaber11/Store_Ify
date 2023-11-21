import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/features/categories/presentation/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppAssets.profile),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.iconsColor,
            ),
          ),
        ],
      ),
      body: const CategoriesViewBody(),
    );
  }
}
