import 'package:native_ads/src/pages/interstitial_ads/view_model/interstitial_ads_view_model.dart';
import 'package:native_ads/src/pages/native_ads/view_model/native_ads_view_model.dart';
import 'package:native_ads/src/pages/rewarded_ads/view_model/rewarded_ads_view_model.dart';
import 'package:provider/provider.dart';

import '../../../common/view_models/app_view_model.dart';
import '../../../common/view_models/theme_view_model.dart';
import '../../../pages/banner_ads/view_model/banner_ads_view_model.dart';
import '../../../pages/settings/settings_view_model.dart';

class AppConstants {
  static const appName = 'AppName';
  static const fontFamily = 'fontFamily';

  static final providers = [
    ChangeNotifierProvider<AppViewModel>(
      create: (context) => AppViewModel(),
    ),
    ChangeNotifierProvider<BannerAdsViewModel>(
      create: (context) => BannerAdsViewModel(),
    ),
    ChangeNotifierProvider<InterstitialAdsViewModel>(
      create: (context) => InterstitialAdsViewModel(),
    ),
    ChangeNotifierProvider<NativeAdsViewModel>(
      create: (context) => NativeAdsViewModel(),
    ),
    ChangeNotifierProvider<RewardedAdsViewModel>(
      create: (context) => RewardedAdsViewModel(),
    ),
    ChangeNotifierProvider<SettingsViewModel>(
      create: (context) => SettingsViewModel(),
    ),
    ChangeNotifierProvider<ThemeViewModel>(
      create: (context) => ThemeViewModel(),
    ),
  ];
}
