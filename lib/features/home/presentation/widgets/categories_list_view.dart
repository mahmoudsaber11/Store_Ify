import 'package:flutter/material.dart';
import 'package:store_ify/core/widgets/custom_categoriy_item.dart';

class CategorieslistView extends StatelessWidget {
  const CategorieslistView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 166,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const CustomCategoriyItem();
          },
          separatorBuilder: ((context, index) => const SizedBox(
                height: 10,
              )),
          itemCount: 5),
    );
  }
}
