import 'dart:async';
import 'dart:developer';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  static final AdManager _instance = AdManager._internal();
  factory AdManager() => _instance;
  AdManager._internal();

  // Test Ad Unit IDs
  static const String bannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  static const String interstitialAdUnitId =
      'ca-app-pub-3940256099942544/1033173712';
  static const String rewardedAdUnitId =
      'ca-app-pub-3940256099942544/5224354917';
  static const String nativeAdUnitId = 'ca-app-pub-3940256099942544/2247696110';

  // Banner Ad Methods
  Future<BannerAd?> loadBannerAd({
    required void Function(bool isLoaded) onLoadStatusChanged,
  }) async {
    final bannerAd = BannerAd(
      adUnitId: bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          log('Banner Ad loaded successfully');
          onLoadStatusChanged(true);
        },
        onAdFailedToLoad: (ad, err) {
          log('Banner Ad failed to load: $err');
          ad.dispose();
          onLoadStatusChanged(false);
        },
      ),
    );

    try {
      await bannerAd.load();
      return bannerAd;
    } catch (e) {
      log('Error loading banner ad: $e');
      return null;
    }
  }

  // Interstitial Ad Methods
  Future<InterstitialAd?> loadInterstitialAd({
    required void Function(bool isLoading) onLoadStatusChanged,
    required void Function(InterstitialAd ad)? onAdDismissed,
  }) async {
    onLoadStatusChanged(true);

    try {
      Completer<InterstitialAd?> completer = Completer();

      await InterstitialAd.load(
        adUnitId: interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            log('Interstitial Ad loaded successfully');
            onLoadStatusChanged(false);

            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
                onAdDismissed?.call(ad);
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                ad.dispose();
                onAdDismissed?.call(ad);
              },
            );

            completer.complete(ad);
          },
          onAdFailedToLoad: (LoadAdError error) {
            log('Interstitial Ad failed to load: $error');
            onLoadStatusChanged(false);
            completer.complete(null);
          },
        ),
      );

      return completer.future;
    } catch (e) {
      log('Error loading interstitial ad: $e');
      onLoadStatusChanged(false);
      return null;
    }
  }

  // Rewarded Ad Methods
  Future<RewardedAd?> loadRewardedAd({
    required void Function(bool isLoading) onLoadStatusChanged,
    required void Function(RewardedAd ad)? onAdDismissed,
    required void Function(RewardItem reward)? onUserEarnedReward,
  }) async {
    onLoadStatusChanged(true);

    try {
      Completer<RewardedAd?> completer = Completer();

      await RewardedAd.load(
        adUnitId: rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            log('Rewarded Ad loaded successfully');
            onLoadStatusChanged(false);

            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
                onAdDismissed?.call(ad);
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                ad.dispose();
                onAdDismissed?.call(ad);
              },
            );

            completer.complete(ad);
          },
          onAdFailedToLoad: (LoadAdError error) {
            log('Rewarded Ad failed to load: $error');
            onLoadStatusChanged(false);
            completer.complete(null);
          },
        ),
      );

      return completer.future;
    } catch (e) {
      log('Error loading rewarded ad: $e');
      onLoadStatusChanged(false);
      return null;
    }
  }

  // Native Ad Methods
  Future<NativeAd?> loadNativeAd({
    required void Function(bool isLoaded) onLoadStatusChanged,
    String? factoryId,
  }) async {
    final nativeAd = NativeAd(
      adUnitId: nativeAdUnitId,
      request: const AdRequest(),
      factoryId: factoryId ?? 'listTile',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          log('Native Ad loaded successfully');
          onLoadStatusChanged(true);
        },
        onAdFailedToLoad: (ad, err) {
          log('Native Ad failed to load: $err');
          ad.dispose();
          onLoadStatusChanged(false);
        },
      ),
    );

    try {
      await nativeAd.load();
      return nativeAd;
    } catch (e) {
      log('Error loading native ad: $e');
      return null;
    }
  }
}
