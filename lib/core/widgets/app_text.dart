import 'package:flutter/widgets.dart';
import 'package:store_ify/core/utils/constant.dart';

class TextGeneralApp extends StatelessWidget {
  const TextGeneralApp({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: kTitleColor,
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
      style: TextStyle(
        color: kTitleColor,
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
      style: TextStyle(
        color: kTitleColor,
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
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: kPrimaryColor,
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
