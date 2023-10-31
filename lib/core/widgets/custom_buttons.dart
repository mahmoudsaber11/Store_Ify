import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/utils/size_config.dart';

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
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(text!,
            // poppins medium 16
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            )),
      ),
    );
  }
}
