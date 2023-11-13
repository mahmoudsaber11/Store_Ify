import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';

class CustomGeneralButton extends StatelessWidget {
<<<<<<< HEAD:lib/core/widgets/custom_buttons.dart
  const CustomGeneralButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
=======
  const CustomGeneralButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String? text;
>>>>>>> 2cd3f08924f7a22590fccbac82ea9449784c1542:lib/core/widgets/custom_general_button.dart
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
<<<<<<< HEAD:lib/core/widgets/custom_buttons.dart
          onPressed: onPressed,
          child: Text(
            text,
            style: AppTextStyle.textStyle16Medium.copyWith(color: Colors.white),
          )),
=======
        onPressed: onPressed,
        child: CustomTextButton(
          text: text!,
        ),
      ),
>>>>>>> 2cd3f08924f7a22590fccbac82ea9449784c1542:lib/core/widgets/custom_general_button.dart
    );
  }
}
