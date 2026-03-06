import 'package:newsandinsightapp/constants.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/services/local_data_source_service.dart';

class HomeLocalDataSource {
  final LocalDataSourceService localDataSourceService;
  HomeLocalDataSource(this.localDataSourceService);

  /////////////////////////

  Future<void> saveNews(List<NewsModel> news) async {
    try {
      await localDataSourceService.saveData(key: newsListKey, value: news);
    } catch (e) {
      rethrow;
    }
  }

  ////////////////////////
  Future<List<NewsModel>> getNews() async {
    try {
      final data = await localDataSourceService.getData(key: newsListKey);
      List<NewsModel> news = List<NewsModel>.from(data ?? []);
      return news;
    } catch (e) {
      rethrow;
    }
  }

  // time methods for better user experience, and don't make a load on server
  Future<void> saveLastFetchTime(DateTime time) async {
    try {
      await localDataSourceService.saveData(key: lastFetchTimeKey, value: time);
    } catch (e) {
      rethrow;
    }
  }

  //////////////////
  Future<DateTime?> getLastFetchTime() async {
    try {
      final timeString = await localDataSourceService.getData(
        key: lastFetchTimeKey,
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
