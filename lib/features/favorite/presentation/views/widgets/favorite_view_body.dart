import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/theme/app_text_styles.dart';
import 'package:newsandinsightapp/core/utils/app_sizes.dart';
import 'package:newsandinsightapp/core/utils/app_strings.dart';
import 'package:newsandinsightapp/features/favorite/presentation/model_view/favorite/favorite_cubit.dart';
import 'package:newsandinsightapp/core/widgets/selected_news_item_widget.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSizes.screenPadding,
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoritesUpdated) {
            final List<NewsModel> favorites = state.favorites;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.favoriteArticles,
                  style: AppTextStyles.headLine,
                ),

                const SizedBox(height: 16),
                Expanded(
                  child: favorites.isEmpty
                      ? const Center(
                          child: Text(
                            "No favorites yet",
                            style: AppTextStyles.title,
                          ),
                        )
                      : ListView.builder(
                          itemCount: favorites.length,
                          itemBuilder: (context, index) {
                            final news = favorites[index];
                            return CustomNewsListViewItem(newsModel: news);
                          },
                        ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
