import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mozaik/app_colors.dart';

class AppThemes {

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      focusColor: AppColors.platinum,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      textTheme: _buildMontserratTextTheme(Colors.black, Colors.grey[700]!),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      primaryColor: AppColors.primaryDark,
      focusColor: AppColors.platinumDark,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      textTheme: _buildMontserratTextTheme(Colors.white, Colors.grey[400]!),
    );
  }
  static TextTheme _buildMontserratTextTheme(Color primaryColor, Color secondaryColor) {
    return TextTheme(
      // Headline Styles
      headlineSmall: GoogleFonts.plusJakartaSans(
        fontSize: 23,
        fontWeight: FontWeight.w800,  // Heavy weight for titles
        color: primaryColor,
      ),
      titleLarge: GoogleFonts.plusJakartaSans(
        fontSize: 21,
        fontWeight: FontWeight.w700,
        color: primaryColor,
      ),
      titleMedium: GoogleFonts.plusJakartaSans(
        fontSize: 19,
        fontWeight: FontWeight.w700,  // Explicit w700 instead of .bold
        color: primaryColor,
      ),

      // Body Styles
      bodyLarge: GoogleFonts.plusJakartaSans(
        fontSize: 17,
        fontWeight: FontWeight.w500,  // Medium instead of normal
        height: 1.5,
        letterSpacing: 0.5,
        color: primaryColor,
      ),
      bodyMedium: GoogleFonts.plusJakartaSans(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),

      // Label/Button Styles
      labelLarge: GoogleFonts.plusJakartaSans(
        fontSize: 17,
        fontWeight: FontWeight.w600,  // Semi-bold for buttons
        color: primaryColor,
      ),
      labelMedium: GoogleFonts.plusJakartaSans(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: secondaryColor,
      ),
    );
  }
}

