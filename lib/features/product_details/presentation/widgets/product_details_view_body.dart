import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_page_title.dart';
import 'package:store_ify/features/product_details/presentation/widgets/image_of_product.dart';
import 'package:store_ify/features/product_details/presentation/widgets/price_of_product.dart';

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
        const ImageOfProduct(),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "Name of product",
          style: AppTextStyles.textStyle16Medium
              .copyWith(color: AppColors.primaryColor),
        ),
        const PriceOfProduct(),
      ],
    );
  }
}
