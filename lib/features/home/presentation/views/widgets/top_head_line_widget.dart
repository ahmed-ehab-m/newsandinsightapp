import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/router/app_router.dart';
import 'package:newsandinsightapp/core/theme/app_text_styles.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/custom_news_image.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/news_custom_container.dart';

class TopHeadLineWidget extends StatelessWidget {
  const TopHeadLineWidget({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.detailsView, extra: newsModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: NewsCustomContainer(
          childWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomNewsImage(imageUrl: newsModel.urlToImage ?? ''),
              Text(
                newsModel.title ?? '',
                style: AppTextStyles.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                newsModel.source?.name ?? '',
                style: AppTextStyles.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
