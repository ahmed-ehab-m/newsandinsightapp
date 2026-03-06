import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:newsandinsightapp/core/di/service_locator.dart';
import 'package:newsandinsightapp/core/services/local_data_source_service.dart';

class AppInitializer {
  static Future<String?> init() async {
    try {
      await dotenv.load(fileName: ".env");
      await LocalDataSourceService.init();
      await setupServiceLocator();
      return null;
    } catch (e) {
      log("app initializer error: $e");
      return "Failed to initialize the app. Please check your storage or restart.";
    }
  }
}
