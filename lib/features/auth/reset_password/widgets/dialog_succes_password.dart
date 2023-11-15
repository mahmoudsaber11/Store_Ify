import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';

class DialogSuccesPassword extends StatelessWidget {
  const DialogSuccesPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 62,
          ),
          Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: const Color(0xff0EAA00),
                  borderRadius: BorderRadius.circular(20)),
              child: Image.asset(AppAssets.successResetPassword)),
          const SizedBox(
            height: 19,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "  Password has been changed successfully",
              maxLines: 2,
              style: AppTextStyles.textStyle16Medium,
            ),
          ),
          const SizedBox(
            height: 55,
          ),
          SizedBox(
            width: 211,
            height: 42,
            child: CustomGeneralButton(text: "Log in", onPressed: () {}),
          ),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
