import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/utils/app_sizes.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/general_top_headlines_widget.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/home_view_app_bar.dart';

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
