import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';
import 'package:newsandinsightapp/core/theme/app_text_styles.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.categoryName,
    required this.isSelected,
  });
  final String categoryName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: EdgeInsets.symmetric(
        horizontal: isSelected ? 20 : 14,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          categoryName,
          style: AppTextStyles.description.copyWith(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
