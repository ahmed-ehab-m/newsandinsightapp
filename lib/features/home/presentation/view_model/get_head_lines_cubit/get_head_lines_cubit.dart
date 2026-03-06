import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/features/home/data/repo/home_repo.dart';

part 'get_head_lines_state.dart';

class GetHeadLinesCubit extends Cubit<GetHeadLinesState> {
  final HomeRepo _homeRepo;
  int currentPage = 1;
  bool isFetchingMore = false;
  bool hasReachedMax = false;
  List<NewsModel> allNews = [];
  GetHeadLinesCubit(this._homeRepo) : super(GetHeadLinesInitial());

  Future<void> getHeadLines({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      allNews.clear();
      hasReachedMax = false;
      isFetchingMore = false;
    }
    //check if user has reached the max or is fetching more now
    if (hasReachedMax || isFetchingMore) return;
    isFetchingMore = true;
    // for best user experience
    // we will show loading only when user open the app
    // or change the category but when user scroll down to load more news we will not show loading
    // to avoid bad user experience
    if (currentPage == 1) {
      emit(GetHeadLinesLoading());
    }
    final result = await _homeRepo.getTopHeadlines(page: currentPage);
    result.fold(
      (failure) => emit(GetHeadLinesFailure(errorMessage: failure.message)),
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
        emit(GetHeadLinesSuccess(news: List.from(allNews)));
      },
    );
  }
}
