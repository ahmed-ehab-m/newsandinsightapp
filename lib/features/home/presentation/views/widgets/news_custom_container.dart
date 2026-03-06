import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';

class NewsCustomContainer extends StatelessWidget {
  const NewsCustomContainer({super.key, required this.childWidget});
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: childWidget,
    );
  }
}
