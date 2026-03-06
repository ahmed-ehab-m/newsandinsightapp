part of 'get_category_news_cubit.dart';

@immutable
sealed class GetCategoryNewsState {}

final class GetCategoryNewsInitial extends GetCategoryNewsState {}

final class GetCategoryNewsLoading extends GetCategoryNewsState {}

final class GetCategoryNewsSuccess extends GetCategoryNewsState {
  final List<NewsModel> news;

  GetCategoryNewsSuccess({required this.news});
}

final class GetCategoryNewsFailure extends GetCategoryNewsState {
  final String errorMessage;

  GetCategoryNewsFailure({required this.errorMessage});
}
