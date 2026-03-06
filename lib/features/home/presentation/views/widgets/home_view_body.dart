import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/utils/app_sizes.dart';
import 'package:newsandinsightapp/features/home/presentation/view_model/get_head_lines_cubit/get_head_lines_cubit.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/general_top_headlines_widget.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/news_loading_widget.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/top_head_line_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [HomeViewAppBar(), GeneralTopHeadlinesWidget()],
      ),
    );
  }
}
