import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/top_head_line_widget.dart';
import 'package:shimmer/shimmer.dart';

class NewsLoadingWidget extends StatelessWidget {
  const NewsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer(
        gradient: LinearGradient(colors: [Colors.white, Colors.grey]),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return TopHeadLineWidget(newsModel: NewsModel());
            },
          ),
        ),
      ),
    );
  }
}
