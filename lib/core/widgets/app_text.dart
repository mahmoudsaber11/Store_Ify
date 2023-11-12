import 'package:flutter/widgets.dart';
import 'package:store_ify/core/utils/app_colors.dart';

class TextGeneralApp extends StatelessWidget {
  const TextGeneralApp({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.titleColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
}

class TextTitleApp extends StatelessWidget {
  const TextTitleApp({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.titleColor,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ),
    );
  }
}

class TextSubTitleOnBoarding extends StatelessWidget {
  const TextSubTitleOnBoarding({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: const TextStyle(
        color: AppColors.titleColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFFFFFFFF),
        ));
  }
}

class TitleTextFieldAndTextButton extends StatelessWidget {
  const TitleTextFieldAndTextButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
        ));
  }
}

class TextResetAndForgetPassword extends StatelessWidget {
  const TextResetAndForgetPassword({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xffD0CFCE),
        ));
  }
}
