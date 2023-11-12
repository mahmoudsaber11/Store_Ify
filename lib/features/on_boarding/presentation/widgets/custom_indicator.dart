import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.dotIndex});
  final num? dotIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: dotIndex!.toInt(),
      decorator: const DotsDecorator(
        activeColor: AppColors.kPrimaryColor,
      ),
    );
  }
}
