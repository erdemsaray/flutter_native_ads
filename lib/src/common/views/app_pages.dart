import 'package:flutter/material.dart';
import 'package:native_ads/src/pages/interstitial_ads/view/interstitial_ads_view.dart';
import 'package:native_ads/src/pages/native_ads/view/native_ads_view.dart';
import 'package:native_ads/src/pages/rewarded_ads/view/rewarded_ads_view.dart';
import 'package:provider/provider.dart';

import '../../pages/banner_ads/view/banner_ads_view.dart';
import '../../pages/settings/settings_view.dart';
import '../view_models/app_view_model.dart';
import '../widgets/animated_indexed_stack.dart';

class AppPages extends StatelessWidget {
  const AppPages({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, appViewModel, child) {
        return AnimatedIndexedStack(
          index: appViewModel.index,
          children: const <Widget>[
            BannerAdsView(),
            InterstitialAdsView(),
            NativeAdsView(),
            RewardedAdsView(),
            SettingsView(),
          ],
        );
      },
    );
  }
}
