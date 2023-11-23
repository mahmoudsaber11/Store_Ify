import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';

class SignWithSocial extends StatelessWidget {
  const SignWithSocial({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(onTap: () {}, child: Image.asset(AppAssets.imagesFacebook)),
        InkWell(onTap: () {}, child: Image.asset(AppAssets.imagesGoogle)),
        InkWell(onTap: () {}, child: Image.asset(AppAssets.imagesTwitter)),
      ],
    );
  }
}
