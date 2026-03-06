import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';
import 'package:newsandinsightapp/core/theme/app_text_styles.dart';
import 'package:newsandinsightapp/core/utils/app_strings.dart';

class SelectedNewsItemWidget extends StatelessWidget {
  const SelectedNewsItemWidget({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width * 1,
      // height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: AspectRatio(
              aspectRatio: 7 / 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: newsModel.urlToImage ?? '',
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
          ),
        ],
      ),
    );
  }
}
