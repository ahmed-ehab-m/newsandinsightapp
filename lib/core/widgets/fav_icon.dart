import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/theme/app_colors.dart';
import 'package:newsandinsightapp/features/favorite/presentation/model_view/favorite/favorite_cubit.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isFav = context.read<FavoriteCubit>().isFavorite(
          newsModel.title ?? '',
        );
        return IconButton(
          onPressed: () {
            context.read<FavoriteCubit>().toggleFavorite(newsModel);
          },
          icon: Icon(
            isFav ? Icons.bookmark : Icons.bookmark_border,
            color: isFav
                ? Theme.of(context).primaryColor
                : AppColors.textSecondary,
          ),
        );
      },
    );
  }
}
