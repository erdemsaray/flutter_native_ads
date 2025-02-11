
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/database/database_constants.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Box? _box;

  DatabaseHelper._internal();

  static DatabaseHelper get instance => _instance;

  Future<void> initializeDatabase() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(DatabaseConstants.settingsBox);
  }

  dynamic read(String key) {
    return _box?.get(key);
  }

  Future<void> write(String key, dynamic value) async {
    await _box?.put(key, value);
  }

  Future<void> remove(String key) async {
    await _box?.delete(key);
  }
}
