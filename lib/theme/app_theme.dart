import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.backgroundColor,
    foregroundColor: AppColors.primaryText,
    titleTextStyle: GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryText,
      ),
    ),
    elevation: 0,
    centerTitle: true,
  ),

  textTheme: TextTheme(
    // Title styles
    titleLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: AppColors.primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    titleMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: AppColors.primaryText,
        fontSize: 14,
        //  fontWeight: FontWeight.w600,
      ),
    ),
    titleSmall: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: AppColors.secondaryText,
        fontSize: 12,
        //  fontWeight: FontWeight.w600,
      ),
    ),
    // body styles
    bodyLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: AppColors.primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
    bodyMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: AppColors.secondaryText,
        fontSize: 14,
      ),
    ),
    bodySmall: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: AppColors.secondaryText,
        fontSize: 12,
      ),
    ),
    // label styles -----> for subtitles
    labelMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: AppColors.ternaryText,
        fontSize: 12,
      ),
    ),
    labelSmall: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: AppColors.secondaryText,
        fontSize: 10,
      ),
    ),
    // Headline styles
    headlineMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: AppColors.primaryText,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);
