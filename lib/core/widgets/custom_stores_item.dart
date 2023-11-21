import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';

class CustomStoresItem extends StatelessWidget {
  const CustomStoresItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          AppAssets.testStores,
          alignment: Alignment.topRight,
          height: 165,
          width: 169,
        ),
        Card(
          elevation: 2,
          child: Container(
            width: 165,
            height: 43,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 27),
                  child: Row(
                    children: [
                      const Text(
                        "Spinneys store ",
                        style: AppTextStyles.textStyle14Regular,
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
