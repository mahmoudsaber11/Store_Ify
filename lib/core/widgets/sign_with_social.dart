import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/assets.dart';

class SignWithSocial extends StatelessWidget {
  const SignWithSocial({
    required this.onTap,
    super.key,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(onTap: () {}, child: Image.asset(AssetsData.face)),
        InkWell(
            onTap: onTap,
            child: Image.asset(
              AssetsData.google,
            )),
        InkWell(onTap: () {}, child: Image.asset(AssetsData.twet)),
      ],
    );
  }
}
