import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/selected_news_item_widget.dart';

class SelectedNewsListView extends StatelessWidget {
  const SelectedNewsListView({super.key, required this.news});
  final List<NewsModel> news;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return SelectedNewsItemWidget(newsModel: news[index]);
      },
    );
  }
}
