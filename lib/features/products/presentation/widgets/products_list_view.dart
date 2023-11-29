import 'package:flutter/material.dart';
import 'package:store_ify/core/widgets/custom_sale_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            itemBuilder: (context, index) => CustomSaleItem(
                  image: image,
                )));
  }
}
