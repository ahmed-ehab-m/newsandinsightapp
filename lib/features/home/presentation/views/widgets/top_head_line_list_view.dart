import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/top_head_line_widget.dart';

class SuccessTopHeadLineListView extends StatelessWidget {
  const SuccessTopHeadLineListView({super.key, required this.news});
  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: news.length,
        itemBuilder: (context, index) {
          return TopHeadLineWidget(newsModel: news[index]);
        },
      ),
    );
  }
}
