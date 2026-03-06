import 'dart:developer';

import 'package:hive_flutter/adapters.dart';

import 'package:newsandinsightapp/constants.dart';
import 'package:newsandinsightapp/core/error/error_messages.dart';
import 'package:newsandinsightapp/core/error/failure.dart';
import 'package:newsandinsightapp/core/models/news_model.dart';
import 'package:newsandinsightapp/core/models/source_model.dart';

class LocalDataSourceService {
  static const String boxName = newsBox;
  static const String favoriteBoxName = favoriteBox;

  static Future<void> init() async {
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(NewsModelAdapter());
      Hive.registerAdapter(SourceModelAdapter());
      await Hive.openBox(boxName);
      await Hive.openBox(favoriteBoxName);
    } on Exception catch (e) {
      log("local data source service error: $e");
      rethrow;
    }
  }

  ///////////////////////////////
  Box getBox() {
    if (!Hive.isBoxOpen(boxName)) {
      throw CacheFailure(message: ErrorMessages.hiveBoxError);
    }
    return Hive.box(boxName);
  }

  //////////////////////////////
  /// basic methods
  /// //////////////////////////
  Future<void> saveData({required String key, required dynamic value}) async {
    try {
      final box = getBox();
      await box.put(key, value);
    } on Exception catch (e) {
      log("save data error: $e");
      rethrow;
    }
  }

  //////////////////////////////
  dynamic getData({required String key}) {
    try {
      final box = getBox();
      return box.get(key);
    } on Exception catch (e) {
      log("get data error: $e");
      rethrow;
    }
  }

  ////////////////////////////
  Future<void> deleteData({required String key}) async {
    try {
      final box = getBox();
      await box.delete(key);
    } on Exception catch (e) {
      log("delete data error: $e");
      rethrow;
    }
  }

  ////////////////////////////
  Future<void> deleteAllData() async {
    try {
      final box = getBox();
      await box.clear();
    } on Exception catch (e) {
      log("delete all data error: $e");
      rethrow;
    }
  }
}
