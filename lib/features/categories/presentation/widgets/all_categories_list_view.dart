import 'package:flutter/material.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/widgets/custom_category_item.dart';

class AllCategoriesListView extends StatelessWidget {
  const AllCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10),
            itemBuilder: (context, index) => CustomCategoryItem(
                  onTap: () {
                    context.navigateTo(routeName: Routes.productsViewRoute);
                  },
                )));
  }
}
