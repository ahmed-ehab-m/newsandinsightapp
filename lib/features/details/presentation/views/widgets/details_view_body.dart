import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';
import 'package:newsandinsightapp/core/theme/app_text_styles.dart';
import 'package:newsandinsightapp/core/utils/app_sizes.dart';
import 'package:newsandinsightapp/features/details/presentation/views/widgets/details_view_image.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.screenPadding,
      child: ListView(
        children: [
          DetailsViewImage(image: newsModel.urlToImage ?? ''),
          SizedBox(height: 10),
          Text(
            newsModel.title ?? '',
            style: AppTextStyles.headLine.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            newsModel.publishedAt ?? "No date",
            style: AppTextStyles.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "By ${newsModel.author ?? "No author"}",
            style: AppTextStyles.description,
          ),
          Text(newsModel.source?.name ?? '', style: AppTextStyles.description),
          SizedBox(height: 30),
          Text(newsModel.description ?? '', style: AppTextStyles.title),
        ],
      ),
    );
  }
}
