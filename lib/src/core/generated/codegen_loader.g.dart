// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> tr = {
  "settings": "Ayarlar",
  "profile": "Profil",
  "notifications": "Bildirimler",
  "language": "Dil",
  "darkMode": "Karanlık Mod",
  "rateUs": "Bizi Değerlendir",
  "sendFeedback": "Geri Bildirim Gönder",
  "about": "Hakkında",
  "home": "Ana Sayfa",
  "history": "Geçmiş",
  "study": "Çalışma"
};
static const Map<String,dynamic> en = {
  "settings": "Settings",
  "profile": "Profile",
  "notifications": "Notifications",
  "language": "Language",
  "darkMode": "Dark Mode",
  "rateUs": "Rate Us",
  "sendFeedback": "Send Feedback",
  "about": "About",
  "home": "Home",
  "history": "History",
  "study": "Study"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": tr, "en": en};
}
