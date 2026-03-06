import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:newsandinsightapp/constants.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial()) {
    getFavorites();
  }
  final Box favoritesBox = Hive.box(favoriteBox);
  void getFavorites() {
    final List<NewsModel> favList = [];
    for (var key in favoritesBox.keys) {
      final jsonString = favoritesBox.get(key);
      if (jsonString != null) {
        favList.add(NewsModel.fromJson(jsonDecode(jsonString)));
      }
    }
    emit(FavoritesUpdated(favList));
  }

  void toggleFavorite(NewsModel news) {
    final String key = news.title ?? 'unknown_title';

    if (favoritesBox.containsKey(key)) {
      favoritesBox.delete(key);
    } else {
      favoritesBox.put(key, jsonEncode(news.toJson()));
    }

    getFavorites();
  }

  bool isFavorite(String title) {
    return favoritesBox.containsKey(title);
  }
}
