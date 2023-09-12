import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.showSuffix = false, 
    required this.prefixIcon, 
    required this.suffixIcon,
  });
  final String hint;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final bool showSuffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: showSuffix ? Icon(suffixIcon) : null,
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
