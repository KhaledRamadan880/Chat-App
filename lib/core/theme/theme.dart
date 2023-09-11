import 'package:chat_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
    textTheme: TextTheme(
      //! Splash 
      bodyLarge: GoogleFonts.odorMeanChey(
        fontSize: 64,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      //! Purple Text
      bodyMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
      //! Button Text Style
      bodySmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      //! Title
      titleLarge: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      //! Sub Title
      titleMedium: GoogleFonts.poppins(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      //! Text Button & Any Grey Text
      titleSmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.grey,
      ),
      
    ),
  );
}
