import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AppAssets.testCategories,
            alignment: Alignment.topRight,
            height: 165,
            width: 169,
          ),
          Card(
            elevation: 2,
            child: Container(
              width: 165,
              height: 53,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      "Electronics",
                      style: AppTextStyles.textStyle14Regular,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Tv,mobile,laptop",
                      style: AppTextStyles.textStyle8Regular,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
