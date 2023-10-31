import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/widgets/general_text.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle});
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
          GeneralText(
            text: title,
            color: kTitleColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          GeneralText(
            text: subTitle,
            color: kTitleColor,
            textAlign: TextAlign.center,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
