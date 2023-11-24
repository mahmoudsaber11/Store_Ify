import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/on_boarding/data/models/on_boarding_model.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.pageInfo,
  });

  final OnBoardingModel pageInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(pageInfo.image),
          SizedBox(height: 8.h),
          Text(
            pageInfo.title,
            style: AppTextStyles.textStyle16Medium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            pageInfo.subTitle,
            style: AppTextStyles.textStyle12Medium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
