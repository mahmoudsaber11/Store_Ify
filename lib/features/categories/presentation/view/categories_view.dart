import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/categories/presentation/widgets/all_categories_list_view.dart';

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
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    context.getBack();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  )),
              const Text(
                "Categories",
                style: AppTextStyles.textStyle16Regular,
              ),
            ],
          ),
          const Expanded(child: AllCategoriesListView())
        ],
      ),
    );
  }
}
