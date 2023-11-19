import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';

class CustomSaleItem extends StatelessWidget {
  const CustomSaleItem({
    Key? key, // Corrected the parameter name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          AppAssets.textProduct,
          alignment: Alignment.topRight,
          height: 209,
          width: 149,
        ),
        Card(
          elevation: 5,
          child: Container(
            width: 145,
            height: 83,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Name of product",
                    style: AppTextStyles.textStyle14Regular,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Description about Product",
                    style: AppTextStyles.textStyle8Regular,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Text(
                        "250.00 LE",
                        style: AppTextStyles.textStyle9Medium,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        "450.00 LE",
                        style: AppTextStyles.textStyle7Regular,
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.favorite_border_outlined,
                          size: 19,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
