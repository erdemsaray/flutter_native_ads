import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:native_ads/src/core/managers/ad_manager.dart';

class BannerAdsViewModel extends ChangeNotifier {
  final _adService = AdManager();
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  BannerAd? get bannerAd => _bannerAd;
  bool get isLoaded => _isLoaded;

  void loadBannerAd() async {
    _bannerAd = await _adService.loadBannerAd(
      onLoadStatusChanged: (isLoaded) {
        _isLoaded = isLoaded;
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
