import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/features/home/presentation/view_model/get_head_lines_cubit/get_head_lines_cubit.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/selected_news_list_view.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/selected_news_loading.dart';

class SelectedItemsSection extends StatelessWidget {
  const SelectedItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHeadLinesCubit, GetHeadLinesState>(
      builder: (context, state) {
        List<NewsModel> news = [];
        if (state is GetHeadLinesFailure) {
          return Text(state.errorMessage);
        }
        if (state is GetHeadLinesSuccess) {
          news = state.news;

          return Expanded(child: SelectedNewsListView(news: news));
        }
        return Expanded(child: const SelectedNewsLoading());
      },
    );
  }
}
