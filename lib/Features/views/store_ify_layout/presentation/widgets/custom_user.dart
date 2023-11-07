import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/assets.dart';
import 'package:store_ify/core/utils/constant.dart';
import 'package:store_ify/core/widgets/general_text.dart';

class CustomUser extends StatelessWidget {
  const CustomUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AssetsData.person),
        Column(
          children: [
            GeneralText(
              text: "Hello,Yasmeen",
              color: appColor,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            const GeneralText(
              text: "Alexandria,Egypt",
              color: Color(0xFF0F3557),
              fontWeight: FontWeight.w300,
              fontSize: 10,
            ),
          ],
        )
      ],
    );
  }
}
