import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';

class AppTextStyles {
  static const TextStyle headLine = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );
  static const TextStyle title = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
  static const TextStyle description = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
  static const TextStyle date = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
}
