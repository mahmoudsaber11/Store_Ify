import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.keyboardType,
    required this.controller,
    this.hintText,
    this.validate,
    this.onChange,
    this.isPassword,
    this.suffix,
    this.onSubmit,
    this.autofillHints,
    this.focusNode,
    this.onEditingComplete,
    this.textCapitalization = TextCapitalization.none,
  });

  final TextInputType keyboardType;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final ValueSetter? onChange;
  final bool? isPassword;
  final Widget? suffix;
  final Function(String submittedText)? onSubmit;
  final List<String>? autofillHints;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword ?? false,
      autofillHints: autofillHints,
      validator: validate,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onEditingComplete: onEditingComplete,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      textCapitalization: textCapitalization,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        suffixIcon: suffix,
        contentPadding: EdgeInsets.zero,
        focusedBorder: _buildTextFieldOutlinedBorder(),
        focusedErrorBorder: _buildTextFieldOutlinedBorder(),
        errorBorder: _buildTextFieldOutlinedBorder(),
        hintText: hintText!,
        hintStyle: AppTextStyles.textStyle16Medium.copyWith(color: Colors.grey),
        labelStyle: AppTextStyles.textStyle16Medium,
        filled: true,
        fillColor: Colors.transparent,
        border: _buildTextFieldOutlinedBorder(),
      ),
    );
  }

  OutlineInputBorder _buildTextFieldOutlinedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: AppColors.fontPrimaryColor),
    );
  }
}
