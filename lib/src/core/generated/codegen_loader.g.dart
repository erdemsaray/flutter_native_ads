// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _tr = {
  "settings": "Ayarlar",
  "profile": "Profil",
  "notifications": "Bildirimler",
  "language": "Dil",
  "darkMode": "Karanlık Mod",
  "rateUs": "Bizi Değerlendirin",
  "sendFeedback": "Geri Bildirim Gönder",
  "about": "Hakkımızda",
  "banner": "Banner",
  "interstitial": "Geçiş",
  "native": "Yerel",
  "rewarded": "Ödüllü",
  "showRewardedAd": "Ödüllü Reklamı Göster",
  "showInterstitialAd": "Geçiş Reklamı Göster"
};
static const Map<String,dynamic> _en = {
  "settings": "Settings",
  "profile": "Profile",
  "notifications": "Notifications",
  "language": "Language",
  "darkMode": "Dark Mode",
  "rateUs": "Rate Us",
  "sendFeedback": "Send Feedback",
  "about": "About",
  "banner": "Banner",
  "interstitial": "Interstitial",
  "native": "Native",
  "rewarded": "Rewarded",
  "showRewardedAd": "Show Rewarded Ad",
  "showInterstitialAd": "Show Interstitial Ad"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"tr": _tr, "en": _en};
}
