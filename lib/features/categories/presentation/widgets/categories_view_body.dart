import 'package:flutter/material.dart';
import 'package:store_ify/core/widgets/custom_page_title.dart';
import 'package:store_ify/features/categories/presentation/widgets/all_categories_list_view.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomPageTitle(
          title: "Categories",
        ),
        Expanded(child: AllCategoriesListView())
      ],
    );
  }
}
