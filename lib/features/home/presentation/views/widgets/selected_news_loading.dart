import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/selected_news_item_widget.dart';
import 'package:shimmer/shimmer.dart';

class SelectedNewsLoading extends StatelessWidget {
  const SelectedNewsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer(
        gradient: LinearGradient(colors: [Colors.white, Colors.grey]),
        child: SizedBox(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return SelectedNewsItemWidget(newsModel: NewsModel());
            },
          ),
        ),
      ),
    );
  }
}
