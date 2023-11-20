import 'package:flutter/material.dart';
import 'package:store_ify/core/widgets/custom_stores_item.dart';

class StoreslistView extends StatelessWidget {
  const StoreslistView({
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
            return const CustomStoresItem();
          },
          separatorBuilder: ((context, index) => const SizedBox(
                height: 10,
              )),
          itemCount: 5),
    );
  }
}
