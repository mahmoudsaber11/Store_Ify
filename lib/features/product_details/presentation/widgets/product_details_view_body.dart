import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_page_title.dart';
import 'package:store_ify/features/product_details/presentation/widgets/description_text.dart';
import 'package:store_ify/features/product_details/presentation/widgets/details_product.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomPageTitle(title: "Details"),
        SizedBox(
          height: 9.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              AppAssets.details,
              height: 203.h,
              width: 205.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Column(
                children: [
                  Image.asset(AppAssets.details1),
                  SizedBox(
                    height: 9.h,
                  ),
                  Image.asset(AppAssets.details2),
                ],
              ),
            ),
          ],
        ),
        const DetailsProduct(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 42.h,
                width: 153.w,
                child: OutlinedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                    ),
                    side: const MaterialStatePropertyAll(
                        BorderSide(width: 1, color: AppColors.primaryColor)),
                  ),
                  onPressed: () {},
                  child: const DescriptionText(text: "Add to Cart "),
                ),
              ),
              SizedBox(
                width: 13.w,
              ),
              SizedBox(
                height: 42.h,
                width: 153.w,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                    ),
                    child: Text(
                      "Buy Now",
                      style: AppTextStyles.textStyle16Medium
                          .copyWith(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
