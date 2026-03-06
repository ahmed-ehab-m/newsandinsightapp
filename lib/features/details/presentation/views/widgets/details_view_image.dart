import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';
import 'package:newsandinsightapp/core/theme/app_text_styles.dart';
import 'package:newsandinsightapp/core/utils/app_strings.dart';

class DetailsViewImage extends StatelessWidget {
  const DetailsViewImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height * 0.35,
        width: double.infinity,
        errorWidget: (context, url, error) => Container(
          color: AppColors.cardColor,
          child: Text(
            AppStrings.imageNotAvailable,
            style: AppTextStyles.description,
          ),
        ),
      ),
    );
  }
}
