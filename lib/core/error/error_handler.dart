import 'package:dio/dio.dart';
import 'package:newsandinsightapp/core/error/error_messages.dart';
import 'package:newsandinsightapp/core/error/failure.dart';
import 'package:newsandinsightapp/core/models/api_error_model.dart';
import 'package:hive/hive.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is DioException) {
      return handleDioError(error);
    } else if (error is HiveError) {
      return CacheFailure(message: ErrorMessages.hiveBoxError);
    } else if (error is CacheFailure) {
      return error;
    } else {
      return GenericFailure(message: ErrorMessages.unexpectedError);
    }
  }
}

//////////////////////////////
Failure handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return ServerFailure(message: ErrorMessages.connectionTimedOut);
    case DioExceptionType.badResponse:
      // for all 4xx status codes
      return handleStatusCode(error.response?.statusCode, error.response?.data);
    case DioExceptionType.cancel:
      return ServerFailure(message: ErrorMessages.requestCancelled);
    case DioExceptionType.connectionError:
      return ServerFailure(message: ErrorMessages.noInternetConnection);
    default:
      return GenericFailure(message: ErrorMessages.unexpectedError);
  }
}

///////////////////////////////////
Failure handleStatusCode(int? statusCode, dynamic data) {
  String? apiMessage;
  if (data is Map<String, dynamic>) {
    try {
      // api error model instead of map<String, dynamic>
      final errorModel = ApiErrorModel.fromJson(data);
      apiMessage = errorModel.message;
    } catch (e) {
      apiMessage = "${ErrorMessages.unexpectedError}: $e";
    }
  } else if (data is String) {
    apiMessage = data;
  }
  // check if api error message is exists
  if (apiMessage != null && apiMessage.isNotEmpty) {
    return ServerFailure(message: apiMessage);
  }
  // check status code if api message is not exists
  switch (statusCode) {
    case 400:
      return ServerFailure(message: ErrorMessages.badRequestPrefix);
    case 401:
      return ServerFailure(message: ErrorMessages.unauthorizedAccess);
    case 403:
      return ServerFailure(message: ErrorMessages.forbiddenRequest);
    case 404:
      return ServerFailure(message: ErrorMessages.resourceNotFound);
    case 500:
      return ServerFailure(message: ErrorMessages.internalServerError);
    default:
      return GenericFailure(message: ErrorMessages.unexpectedError);
  }
}
