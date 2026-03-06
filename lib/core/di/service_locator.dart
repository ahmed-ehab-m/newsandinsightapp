import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:newsandinsightapp/core/services/api_service.dart';
import 'package:newsandinsightapp/core/services/check_internet_service.dart';
import 'package:newsandinsightapp/core/services/local_data_source_service.dart';
import 'package:newsandinsightapp/features/home/data/data_sources/home_local_data_source.dart';
import 'package:newsandinsightapp/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:newsandinsightapp/features/home/data/repo/home_repo.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // our external dependencies
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<InternetConnection>(() => InternetConnection());

  // our core services
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));
  sl.registerLazySingleton<LocalDataSourceService>(
    () => LocalDataSourceService(),
  );
  sl.registerLazySingleton<CheckInternetService>(
    () => CheckInternetService(internetConnection: sl<InternetConnection>()),
  );

  // our data sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(apiService: sl()),
  );
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSource(localDataSourceService: sl()),
  );
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepo(
      sl(), // Remote Data Source
      sl(), // Local Data Source
      sl(), // check internet connection
    ),
  );
}
