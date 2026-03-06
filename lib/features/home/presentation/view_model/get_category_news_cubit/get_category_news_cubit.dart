import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/features/home/data/repo/home_repo.dart';

part 'get_category_news_state.dart';

class GetCategoryNewsCubit extends Cubit<GetCategoryNewsState> {
  final HomeRepo _homeRepo;

  GetCategoryNewsCubit(this._homeRepo) : super(GetCategoryNewsInitial());
  String currentCategory = 'business';
  Future<void> getCategoryNews({
    String? category,
    int? page = 1,
    bool? isRefresh = false,
  }) async {
    currentCategory = category ?? 'business';
    // for best user experience
    // we will show loading only when user open the app
    // or change the category but when user scroll down to load more news we will not show loading
    // to avoid bad user experience
    if (page == 1) {
      emit(GetCategoryNewsLoading());
    }
    final result = await _homeRepo.getTopHeadlines(
      page: page ?? 1,
      category: category,
    );
    result.fold(
      (failure) => emit(GetCategoryNewsFailure(errorMessage: failure.message)),
      (news) {
        emit(GetCategoryNewsSuccess(news: news));
      },
    );
  }
}
