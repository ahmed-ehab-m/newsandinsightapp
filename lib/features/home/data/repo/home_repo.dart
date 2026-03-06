import 'package:dartz/dartz.dart';
import 'package:newsandinsightapp/core/error/error_handler.dart';
import 'package:newsandinsightapp/core/error/error_messages.dart';
import 'package:newsandinsightapp/core/error/failure.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/services/check_internet_service.dart';
import 'package:newsandinsightapp/features/home/data/data_sources/home_local_data_source.dart';
import 'package:newsandinsightapp/features/home/data/data_sources/home_remote_data_source.dart';

class HomeRepo {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;
  final CheckInternetService checkInternetService;
  HomeRepo(
    this.remoteDataSource,
    this.localDataSource,
    this.checkInternetService,
  );
  Future<Either<Failure, List<NewsModel>>> getTopHeadlines({
    String? category,
    int? page = 1,
    bool isRefresh = false,
  }) async {
    try {
      // for better user experience, and don't make a load on server
      // first check if user close the app and reopen it less than one minute,
      // if yes then return the cached news
      if (page == 1 && !isRefresh) {
        final DateTime? lastFetchTime = await localDataSource
            .getLastFetchTime();
        if (lastFetchTime != null) {
          final difference = DateTime.now().difference(lastFetchTime);
          if (difference.inMinutes < 1) {
            final cachedNews = await localDataSource.getNews();
            if (cachedNews.isNotEmpty) {
              return Right(cachedNews);
            }
          }
        }
      }
      // check internet connection before making api call
      if (await checkInternetService.isConnected()) {
        final remoteNews = await remoteDataSource.getTopHeadlines(
          page: page ?? 1,
          category: category,
        );
        // save only the first page to cache, because the user may not scroll to the end of the list
        if (page == 1) {
          await localDataSource.saveNews(remoteNews);
          // save the last fetch time to check it later
          await localDataSource.saveLastFetchTime(DateTime.now());
        }
        return Right(remoteNews);
      }
      // if there is no internet connection, return the cached news if exist
      else {
        if (page == 1) {
          final localNews = await localDataSource.getNews();
          if (localNews.isNotEmpty) {
            return Right(localNews);
          }
        }
        // else return no internet connection error
        return Left(ServerFailure(message: ErrorMessages.noInternetConnection));
      }
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
