import 'package:dartz/dartz.dart';
import 'package:newsandinsightapp/constants.dart';
import 'package:newsandinsightapp/core/error/error_handler.dart';
import 'package:newsandinsightapp/core/error/failure.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/services/local_data_source_service.dart';

class HomeLocalDataSource {
  final LocalDataSourceService localDataSourceService;
  HomeLocalDataSource(this.localDataSourceService);

  /////////////////////////

  Future<Either<Failure, void>> saveNews(List<NewsModel> news) async {
    try {
      await localDataSourceService.saveData(key: newsListKey, value: news);
      return Right(null);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }

  ////////////////////////
  Future<Either<Failure, List<NewsModel>>> getNews() async {
    try {
      final data = await localDataSourceService.getData(key: newsListKey);
      List<NewsModel> news = List<NewsModel>.from(data ?? []);
      return Right(news);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
