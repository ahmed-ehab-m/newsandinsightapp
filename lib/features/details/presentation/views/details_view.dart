import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/widgets/fav_icon.dart';
import 'package:newsandinsightapp/features/details/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [FavIcon(newsModel: newsModel)]),
      body: SafeArea(child: DetailsViewBody(newsModel: newsModel)),
    );
  }
}
