import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';
import 'package:newsandinsightapp/core/theme/app_text_styles.dart';
import 'package:newsandinsightapp/core/utils/app_strings.dart';
import 'package:newsandinsightapp/features/home/presentation/view_model/get_head_lines_cubit/get_head_lines_cubit.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/news_loading_widget.dart';
import 'package:newsandinsightapp/features/home/presentation/views/widgets/top_head_line_list_view.dart';

class GeneralTopHeadlinesWidget extends StatelessWidget {
  const GeneralTopHeadlinesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.topHeadlines, style: AppTextStyles.headLine),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Divider(thickness: 1, color: AppColors.secondaryColor),
        ),
        BlocBuilder<GetHeadLinesCubit, GetHeadLinesState>(
          builder: (context, state) {
            List<NewsModel> news = [];
            if (state is GetHeadLinesFailure) {
              return Text(state.errorMessage);
            }
            if (state is GetHeadLinesSuccess) {
              news = state.news;

              return SuccessTopHeadLineListView(news: news);
            }
            return const NewsLoadingWidget();
          },
        ),
      ],
    );
  }
}
