import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:native_ads/src/core/managers/ad_manager.dart';

class NativeAdsViewModel extends ChangeNotifier {
  final _adService = AdManager();
  NativeAd? _nativeAd;
  bool _isLoaded = false;

  NativeAd? get nativeAd => _nativeAd;
  bool get isLoaded => _isLoaded;

  void loadNativeAd() async {
    _nativeAd = await _adService.loadNativeAd(
      onLoadStatusChanged: (isLoaded) {
        _isLoaded = isLoaded;
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }
}
