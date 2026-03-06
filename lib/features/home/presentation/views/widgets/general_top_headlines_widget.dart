import 'package:flutter/material.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';
import 'package:newsandinsightapp/core/theme/app_text_styles.dart';
import 'package:newsandinsightapp/core/utils/app_strings.dart';
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
        TopHeadLineListView(),
      ],
    );
  }
}
