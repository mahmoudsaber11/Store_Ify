import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/assets.dart';
import 'package:store_ify/core/utils/constant.dart';

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
            Text(
              "Hello,Yasmeen",
              style: TextStyle(
                color: appColor,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            Text(
              "Alexandria,Egypt",
              style: TextStyle(
                color: textProfileColor,
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
            )
          ],
        )
      ],
    );
  }
}
