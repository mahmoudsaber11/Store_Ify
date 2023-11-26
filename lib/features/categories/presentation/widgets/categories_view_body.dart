import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/categories/presentation/widgets/all_categories_list_view.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            Text(
              "Categories",
              style: AppTextStyles.textStyle16Regular,
            ),
          ],
        ),
        const Expanded(child: AllCategoriesListView())
      ],
    );
  }
}
