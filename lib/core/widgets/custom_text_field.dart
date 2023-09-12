import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.showSuffix = false,
    required this.prefixIcon,
    this.suffixIcon = const Text(''),
    this.isObscure = false,
  });
  final String hint;
  final IconData prefixIcon;
  final Widget suffixIcon;
  final bool showSuffix;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      cursorColor: AppColors.primary,
      style: appTheme().textTheme.titleMedium,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: hint,
        prefixIcon: Icon(prefixIcon),
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
