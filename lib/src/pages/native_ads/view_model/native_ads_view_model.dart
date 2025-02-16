import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:native_ads/src/core/managers/ad_manager.dart';

class NativeAdsViewModel extends ChangeNotifier {
  final _adService = AdManager();
  NativeAd? _nativeAd;
  NativeAd? _nativeAdWithBackground;
  NativeAd? _nativeAdMedia;

  bool _isLoaded = false;
  bool _isLoadedWithBackground = false;
  bool _isLoadedMedia = false;

  NativeAd? get nativeAd => _nativeAd;
  NativeAd? get nativeAdWithBackground => _nativeAdWithBackground;
  NativeAd? get nativeAdMedia => _nativeAdMedia;

  bool get isLoaded => _isLoaded;
  bool get isLoadedWithBackground => _isLoadedWithBackground;
  bool get isLoadedMedia => _isLoadedMedia;

  NativeAdsViewModel() {
    _initAds();
  }

  Future<void> _initAds() async {
    await loadNativeAd();
    await loadNativeAdWithBackground();
    await loadNativeAdMedia();
  }

  Future<void> loadNativeAdMedia() async {
    if (_nativeAdMedia != null) {
      _nativeAdMedia!.dispose();
      _nativeAdMedia = null;
      _isLoadedMedia = false;
      notifyListeners();
    }

    _nativeAdMedia = await _adService.loadNativeAd(
      onLoadStatusChanged: (isLoaded) {
        _isLoadedMedia = isLoaded;
        notifyListeners();
      },
      factoryId: 'nativeAdMedia',
    );
  }

  Future<void> loadNativeAdWithBackground() async {
    if (_nativeAdWithBackground != null) {
      _nativeAdWithBackground!.dispose();
      _nativeAdWithBackground = null;
      _isLoadedWithBackground = false;
      notifyListeners();
    }

    _nativeAdWithBackground = await _adService.loadNativeAd(
      onLoadStatusChanged: (isLoaded) {
        _isLoadedWithBackground = isLoaded;
        notifyListeners();
      },
      factoryId: 'nativeAdWithBackground',
    );
  }

  Future<void> loadNativeAd() async {
    if (_nativeAd != null) {
      _nativeAd!.dispose();
      _nativeAd = null;
      _isLoaded = false;
      notifyListeners();
    }

    _nativeAd = await _adService.loadNativeAd(
      onLoadStatusChanged: (isLoaded) {
        _isLoaded = isLoaded;
        notifyListeners();
      },
      factoryId: 'listTile',
    );
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    _nativeAdWithBackground?.dispose();
    _nativeAdMedia?.dispose();
    super.dispose();
  }
}
