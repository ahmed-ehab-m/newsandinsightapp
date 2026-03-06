import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:newsandinsightapp/core/config/env_config.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio) {
    _dio.options.baseUrl = EnvConfig.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }
  final String apiKey = EnvConfig.apiKey;

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      queryParameters ??= {};
      queryParameters['apiKey'] = apiKey;
      final response = await _dio.get(
        endPoint,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      log("ApiService get Error: $e");
      rethrow;
    }
  }
}
