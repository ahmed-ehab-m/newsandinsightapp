import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsandinsightapp/features/home/presentation/view_model/get_category_news_cubit/get_category_news_cubit.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/selected_news_list_view.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/selected_news_loading.dart';

class SelectedItemsSection extends StatelessWidget {
  const SelectedItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoryNewsCubit, GetCategoryNewsState>(
      builder: (context, state) {
        if (state is GetCategoryNewsFailure) {
          log("get category news error message: ${state.errorMessage}");

          return SliverToBoxAdapter(child: Text(state.errorMessage));
        }
        if (state is GetCategoryNewsSuccess) {
          print("get category news success message: ${state.news.length}");
          log("get category news success message: ${state.news.length}");
          return SelectedNewsListView(news: state.news);
        }
        if (state is GetCategoryNewsLoading) {
          log("get category news loading message");
          return const SelectedNewsLoading();
        }
        return const SelectedNewsLoading();
      },
    );
  }
}
