import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/size_config.dart';
import 'package:store_ify/core/widgets/app_text.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton(
      {super.key, required this.text, required this.onPressed});
  final String? text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
          onPressed: onPressed,
          child: CustomTextButton(
            text: text!,
          )),
    );
  }
}
