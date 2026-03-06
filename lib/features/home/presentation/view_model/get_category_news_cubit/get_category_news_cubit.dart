import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/features/home/data/repo/home_repo.dart';

part 'get_category_news_state.dart';

class GetCategoryNewsCubit extends Cubit<GetCategoryNewsState> {
  final HomeRepo _homeRepo;

  GetCategoryNewsCubit(this._homeRepo) : super(GetCategoryNewsInitial());
  String currentCategory = 'business';
  List<NewsModel> allNews = [];
  // for applying pagination and better perfomance and UX
  int currentPage = 1;
  bool isFetchingMore = false;
  bool hasReachedMax = false;
  Future<void> getCategoryNews({
    String? category,
    bool isRefresh = false,
  }) async {
    final selectedCategory = category ?? 'business';

    // reset pagination when category changes or on refresh
    if (isRefresh || selectedCategory != currentCategory) {
      currentPage = 1;
      allNews.clear();
      hasReachedMax = false;
      isFetchingMore = false;
    }
    currentCategory = selectedCategory;

    //check if user has reached the max or is fetching more now
    if (hasReachedMax || isFetchingMore) return;
    isFetchingMore = true;
    // for best user experience
    // we will show loading only when user open the app
    // or change the category but when user scroll down to load more news we will not show loading
    // to avoid bad user experience
    if (currentPage == 1) {
      emit(GetCategoryNewsLoading());
    }
    final result = await _homeRepo.getTopHeadlines(
      page: currentPage,
      category: currentCategory,
    );
    result.fold(
      (failure) => emit(GetCategoryNewsFailure(errorMessage: failure.message)),
      (news) {
        // finish fetching more
        isFetchingMore = false;
        if (news.isEmpty) {
          hasReachedMax = true;
        } else {
          // add new news to the existing news for better UX
          allNews.addAll(news);
          currentPage++;
        }
        emit(GetCategoryNewsSuccess(news: List.from(allNews)));
      },
    );
  }
}
