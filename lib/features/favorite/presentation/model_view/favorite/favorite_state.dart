part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoritesUpdated extends FavoriteState {
  final List<NewsModel> favorites;
  FavoritesUpdated(this.favorites);
}
