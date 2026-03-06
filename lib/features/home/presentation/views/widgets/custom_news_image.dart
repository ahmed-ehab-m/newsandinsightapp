import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';
import 'package:newsandinsightapp/core/theme/app_text_styles.dart';
import 'package:newsandinsightapp/core/utils/app_strings.dart';

class CustomNewsImage extends StatelessWidget {
  const CustomNewsImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: double.infinity,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Container(
              color: AppColors.cardColor,
              child: Text(
                AppStrings.imageNotAvailable,
                style: AppTextStyles.description,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
