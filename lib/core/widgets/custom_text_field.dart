import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final ValueSetter? onChange;
  final bool? isPassword;
  final Widget? suffix;
  final ValueSetter? onSubmitted;
  final List<String>? autofillHints;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;

  const CustomTextField({
    super.key,
    required this.keyboardType,
    required this.controller,
    this.hintText,
    this.validate,
    this.onChange,
    this.isPassword,
    this.suffix,
    this.onSubmitted,
    this.autofillHints,
    this.focusNode,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword ?? false,
      autofillHints: autofillHints,
      validator: validate,
      onChanged: onChange,
      onFieldSubmitted: onSubmitted,
      onEditingComplete: onEditingComplete,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
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
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.titleColor),
    );
  }
}
