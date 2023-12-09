import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/features/categories/data/models/categories_model.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({
    super.key,
    this.onTap,
    required this.categoriesModel,
  });
  final void Function()? onTap;
  final CategoriesModel categoriesModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 165.h,
            width: 169.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage(
                  AppAssets.categories,
                ), // Provide the image path
                //  fit: BoxFit.fill, // Adjust the BoxFit as needed
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: Container(
              width: 169.w,
              height: 53.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    categoriesModel.name,
                    style: AppTextStyles.textStyle14Regular,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    categoriesModel.description,
                    style: AppTextStyles.textStyle8Regular,
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
