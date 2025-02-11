

import 'package:flutter/material.dart';

class LocalizationHelper {
  static final LocalizationHelper _instance = LocalizationHelper._internal();
  static LocalizationHelper get instance => _instance;
  LocalizationHelper._internal();

  final String languageAssetsPath = 'assets/translations';

  final defaultLocale = const Locale('en');
  final enLocale = const Locale('en');
  final trLocale = const Locale('tr');

  List<Locale> get supportedLocales => [
        enLocale,
        trLocale,
      ];
}
