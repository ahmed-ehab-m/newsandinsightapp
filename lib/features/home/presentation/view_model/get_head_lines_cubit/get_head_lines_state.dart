part of 'get_head_lines_cubit.dart';

@immutable
sealed class GetHeadLinesState {}

final class GetHeadLinesInitial extends GetHeadLinesState {}

final class GetHeadLinesLoading extends GetHeadLinesState {}

final class GetHeadLinesSuccess extends GetHeadLinesState {
  final List<NewsModel> news;

  GetHeadLinesSuccess({required this.news});
}

final class GetHeadLinesFailure extends GetHeadLinesState {
  final String errorMessage;

  GetHeadLinesFailure({required this.errorMessage});
}
