import 'package:newsandinsightapp/constants.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/services/local_data_source_service.dart';

class HomeLocalDataSource {
  final LocalDataSourceService localDataSourceService;
  HomeLocalDataSource({required this.localDataSourceService});

  // build cache key based on category
  String _newsKey(String? category) =>
      category == null ? newsListKey : '${newsListKey}_$category';

  String _timeKey(String? category) =>
      category == null ? lastFetchTimeKey : '${lastFetchTimeKey}_$category';

  /////////////////////////

  Future<void> saveNews(List<NewsModel> news, {String? category}) async {
    try {
      await localDataSourceService.saveData(
        key: _newsKey(category),
        value: news,
      );
    } catch (e) {
      rethrow;
    }
  }

  ////////////////////////
  Future<List<NewsModel>> getNews({String? category}) async {
    try {
      final data = await localDataSourceService.getData(
        key: _newsKey(category),
      );
      List<NewsModel> news = List<NewsModel>.from(data ?? []);
      return news;
    } catch (e) {
      rethrow;
    }
  }

  // time methods for better user experience, and don't make a load on server
  Future<void> saveLastFetchTime(DateTime time, {String? category}) async {
    try {
      await localDataSourceService.saveData(
        key: _timeKey(category),
        value: time,
      );
    } catch (e) {
      rethrow;
    }
  }

  //////////////////
  Future<DateTime?> getLastFetchTime({String? category}) async {
    try {
      final timeString = await localDataSourceService.getData(
        key: _timeKey(category),
      );
      if (timeString != null && timeString is DateTime) {
        return timeString;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
