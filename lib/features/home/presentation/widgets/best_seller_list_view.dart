import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/widgets/custom_sale_item.dart';

class BestSellerlistView extends StatelessWidget {
  const BestSellerlistView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const CustomSaleItem(
              image: AppAssets.testBestSelling,
            );
          },
          separatorBuilder: ((context, index) => const SizedBox(
                height: 19,
              )),
          itemCount: 5),
    );
  }
}
