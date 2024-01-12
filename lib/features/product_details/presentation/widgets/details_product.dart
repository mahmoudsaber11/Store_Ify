import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/config/themes/app_colors.dart';
import 'package:store_ify/config/themes/app_text_styles.dart';
import 'package:store_ify/features/product_details/presentation/widgets/description_text.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 27.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          const Align(
            alignment: Alignment.center,
            child: DescriptionText(
              text: "Name of product",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "250.00 LE",
                style: AppTextStyles.textStyle16Medium.copyWith(
                    color: AppColors.priceColor, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 32.w),
              Text(
                "450.00 LE",
                style: AppTextStyles.textStyle16Regular.copyWith(
                  color: AppColors.iconsColor,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 21.h,
          ),
          const DescriptionText(text: "Sizes"),
          Row(
            children: [
              Text(
                " XS   S    M   L   XL  XXL  XXL",
                style: AppTextStyles.textStyle16Regular,
              ),
              const Spacer(),
              Padding(
                  padding: EdgeInsets.only(right: 33.w),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_border_outlined,
                      size: 32,
                    ),
                  )),
            ],
          ),
          const DescriptionText(text: "Colors"),
          SizedBox(
            height: 9.h,
          ),
          Row(
            children: [
              Image.asset(
                AppAssets.circleColor,
                width: 16.w,
                height: 16.h,
              ),
              SizedBox(
                width: 8.w,
              ),
              Icon(
                Icons.circle,
                color: const Color(0xff256BC5),
                size: 16.sp,
              ),
              SizedBox(
                width: 8.w,
              ),
              Icon(
                Icons.circle,
                color: const Color(0xffEC52AE),
                size: 16.sp,
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          const DescriptionText(text: "Details"),
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.\nEtiam eu turpis molestie, dictum est\na, mattis tellus. Sed dignissim,\nmets nec fringilla accumsan,\nrisus sem sollicitudin lacus",
            style: AppTextStyles.textStyle16Medium
                .copyWith(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
