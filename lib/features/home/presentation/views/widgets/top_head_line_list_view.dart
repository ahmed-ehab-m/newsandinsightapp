import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/features/home/presentation/view_model/get_head_lines_cubit/get_head_lines_cubit.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/top_head_line_widget.dart';

class SuccessTopHeadLineListView extends StatefulWidget {
  const SuccessTopHeadLineListView({super.key, required this.news});
  final List<NewsModel> news;

  @override
  State<SuccessTopHeadLineListView> createState() =>
      _SuccessTopHeadLineListViewState();
}

class _SuccessTopHeadLineListViewState
    extends State<SuccessTopHeadLineListView> {
  final ScrollController horizontalScrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    horizontalScrollController.addListener(onHorizontalScroll);
  }

  void onHorizontalScroll() {
    final maxScroll = horizontalScrollController.position.maxScrollExtent;
    final currentScroll = horizontalScrollController.position.pixels;
    if (currentScroll >= (maxScroll * 0.9)) {
      context.read<GetHeadLinesCubit>().getHeadLines();
    }
  }

  @override
  void dispose() {
    horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.38,
      child: ListView.builder(
        controller: horizontalScrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.news.length,
        itemBuilder: (context, index) {
          return TopHeadLineWidget(newsModel: widget.news[index]);
        },
      ),
    );
  }
}
