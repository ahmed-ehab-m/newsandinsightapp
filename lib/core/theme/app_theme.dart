import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';
import 'package:newsandinsightapp/core/theme/app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: const TextTheme(
        headlineLarge: AppTextStyles.headLine,
        titleMedium: AppTextStyles.title,
        bodyMedium: AppTextStyles.description,
        bodySmall: AppTextStyles.date,
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        surface: AppColors.backgroundColor,
      ),
    );
  }
}
