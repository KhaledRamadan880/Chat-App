import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.showSuffix = false,
    this.prefixIcon = const Text(''),
    this.suffixIcon = const Text(''),
    this.isObscure = false, required this.controller, this.validator,
  });
  final String hint;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool showSuffix;
  final bool isObscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObscure,
      cursorColor: AppColors.primary,
      style: appTheme().textTheme.titleMedium,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.primary,
        prefixIconColor: AppColors.primary,
        //! Borders
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
