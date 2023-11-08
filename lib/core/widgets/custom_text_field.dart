import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/constant.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? inputType;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final ValueSetter? onChange;
  final bool? isPassword;
  final Widget? suffix;
  final ValueSetter? onSubmited;
  const CustomTextField({
    super.key,
    this.inputType,
    this.hintText,
    required this.controller,
    this.validate,
    this.onChange,
    this.isPassword,
    this.suffix,
    this.onSubmited,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword ?? false,
      validator: validate,
      onChanged: onChange,
      onFieldSubmitted: onSubmited,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
          suffixIcon: suffix,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: kTitleColor)),
          hintText: hintText!,
          labelStyle: TextStyle(color: kTitleColor),
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: kTitleColor),
          )),
    );
  }
}

// Widget defaultFormField({
//   context,
//   required final TextInputType? inputType,
//   required final String? hintText,
//   required final TextEditingController controller,
//   required final String? Function(String?)? validate,
//   final ValueSetter? onChange,
//   bool? isPassword,
//   Widget? suffix,
// }) =>
//     TextFormField(
//       obscureText: isPassword ?? false,
//       validator: validate,
//       onChanged: onChange,
//       controller: controller,
//       keyboardType: inputType,
//       decoration: InputDecoration(
//           suffixIcon: suffix,
//           focusedBorder:
//               OutlineInputBorder(borderSide: BorderSide(color: kTitleColor)),
//           hintText: hintText!,
//           labelStyle: TextStyle(color: kTitleColor),
//           filled: true,
//           fillColor: Colors.transparent,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: kTitleColor),
//           )),
//     );
