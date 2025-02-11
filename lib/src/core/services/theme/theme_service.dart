
import 'package:flutter/material.dart';

import '../../constants/database/database_constants.dart';
import '../../helpers/database_helper.dart';

class ThemeService {
  ThemeService._init();

  static final ThemeService _instance = ThemeService._init();

  static ThemeService get instance => _instance;

  bool isSavedDarkMode() => DatabaseHelper.instance.read(DatabaseConstants.theme) ?? false;

  ThemeMode getTheme() => isSavedDarkMode() == true ? ThemeMode.dark : ThemeMode.light;

  Future<void> changeTheme(value) async => await DatabaseHelper.instance.write(DatabaseConstants.theme, value);
}
