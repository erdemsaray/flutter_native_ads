import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:native_ads/src/core/managers/ad_manager.dart';

class InterstitialAdsViewModel extends ChangeNotifier {
  final _adService = AdManager();
  InterstitialAd? _interstitialAd;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void loadInterstitialAd() async {
    if (_interstitialAd != null) return;

    _interstitialAd = await _adService.loadInterstitialAd(
      onLoadStatusChanged: (isLoading) {
        _isLoading = isLoading;
        notifyListeners();
      },
      onAdDismissed: (ad) {
        _interstitialAd = null;
        loadInterstitialAd();
      },
    );
  }

  void showInterstitialAd() {
    if (_interstitialAd == null) {
      loadInterstitialAd();
      return;
    }

    _interstitialAd!.show();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }
}
