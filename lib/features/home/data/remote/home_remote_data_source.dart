import 'package:dartz/dartz.dart';
import 'package:newsandinsightapp/core/config/env_config.dart';
import 'package:newsandinsightapp/core/error/error_handler.dart';
import 'package:newsandinsightapp/core/error/failure.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/services/api_service.dart';

class HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSource({required this.apiService});

  Future<Either<Failure, List<NewsModel>>> getTopHeadlines({
    int page = 1,
    String? category,
  }) async {
    try {
      final response = await apiService.get(
        endPoint: EnvConfig.topHeadlinesEndPoint,
        queryParameters: {
          'country': 'us',
          "page": page,
          "pageSize": 10,
          'category': ?category,
        },
      );
      final List<dynamic> articlesList = response['articles'] ?? [];
      List<NewsModel> news = articlesList.map((newsJson) {
        return NewsModel.fromJson(newsJson);
      }).toList();
      return Right(news);
    } catch (e) {
      return Left(ErrorHandler.handleError(e));
    }
  }
}
