import 'package:newsandinsightapp/core/config/env_config.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/services/api_service.dart';

class HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSource({required this.apiService});

  // one method to get top headlines news with or without category
  Future<List<NewsModel>> getTopHeadlinesNews({
    int page = 1,
    String? category,
  }) async {
    try {
      final response = await apiService.get(
        endPoint: EnvConfig.topHeadlinesEndPoint,
        queryParameters: {
          // to get more data when filter by category
          if (category == null) 'country': 'us',
          "page": page,
          "pageSize": 10,
          if (category != null)
            'category':
                category, //check if user choose any category presented in Home screen
        },
      );
      final List<dynamic> articlesList = response['articles'] ?? [];
      List<NewsModel> news = articlesList.map((newsJson) {
        return NewsModel.fromJson(newsJson);
      }).toList();
      return news;
    } catch (e) {
      rethrow;
    }
  }
}
