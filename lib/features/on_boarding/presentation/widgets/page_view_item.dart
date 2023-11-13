import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: AppTextStyles.textStyle16Medium,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            subTitle,
            style: AppTextStyles.textStyle12Medium,
          ),
        ],
      ),
    );
  }
}
