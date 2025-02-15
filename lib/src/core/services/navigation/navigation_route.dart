import 'package:flutter/material.dart';
import 'package:native_ads/src/pages/banner_ads/view/banner_ads_view.dart';
import 'package:native_ads/src/pages/interstitial_ads/view/interstitial_ads_view.dart';
import 'package:native_ads/src/pages/native_ads/view/native_ads_view.dart';
import 'package:native_ads/src/pages/rewarded_ads/view/rewarded_ads_view.dart';
import 'package:native_ads/src/pages/settings/settings_view.dart';
import '../../../common/views/app_view.dart';
import '../../constants/navigation/navigation_constants.dart';

// Router structure, add another arguments if you need
class NavigationRoute {
  NavigationRoute._init();

  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case NavigationConstants.root:
        return MaterialPageRoute(
          builder: (context) => const AppView(),
          settings: RouteSettings(arguments: args),
        );
      case NavigationConstants.bannerAds:
        return MaterialPageRoute(
          builder: (context) => const BannerAdsView(),
          settings: RouteSettings(arguments: args),
        );
      case NavigationConstants.interstitialAds:
        return MaterialPageRoute(
          builder: (context) => const InterstitialAdsView(),
          settings: RouteSettings(arguments: args),
        );
      case NavigationConstants.rewardedAds:
        return MaterialPageRoute(
          builder: (context) => const RewardedAdsView(),
          settings: RouteSettings(arguments: args),
        );
      case NavigationConstants.nativeAds:
        return MaterialPageRoute(
          builder: (context) => const NativeAdsView(),
          settings: RouteSettings(arguments: args),
        );
      case NavigationConstants.settings:
        return MaterialPageRoute(
          builder: (context) => const SettingsView(),
          settings: RouteSettings(arguments: args),
        );
    }
    return null;
  }
}
