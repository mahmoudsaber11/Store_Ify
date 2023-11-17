import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onChanged, this.onPressed});
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(24.0), // Adjust the radius as needed
      ),
      color: Colors.white,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: 'Search',
            hintStyle: AppTextStyles.textStyle16Regular,
            prefixIcon: Image.asset(AppAssets.search),
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Image.asset(AppAssets.edit),
            )),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(24),
    );
  }
}
