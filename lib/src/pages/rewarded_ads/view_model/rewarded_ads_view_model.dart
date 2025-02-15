import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:native_ads/src/core/managers/ad_manager.dart';

class RewardedAdsViewModel extends ChangeNotifier {
  final _adService = AdManager();
  RewardedAd? _rewardedAd;
  bool _isLoading = false;
  String _rewardMessage = '';

  bool get isLoading => _isLoading;
  String get rewardMessage => _rewardMessage;

  void loadRewardedAd() async {
    if (_rewardedAd != null) return;

    _rewardedAd = await _adService.loadRewardedAd(
      onLoadStatusChanged: (isLoading) {
        _isLoading = isLoading;
        notifyListeners();
      },
      onAdDismissed: (ad) {
        _rewardedAd = null;
        loadRewardedAd();
      },
      onUserEarnedReward: (reward) {
        _rewardMessage =
            'Congratulations! You earned ${reward.amount} ${reward.type}';
        notifyListeners();
      },
    );
  }

  void showRewardedAd() {
    if (_rewardedAd == null) {
      loadRewardedAd();
      return;
    }

    _rewardedAd!.show(
      onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        _rewardMessage =
            'Congratulations! You earned ${reward.amount} ${reward.type}';
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }
}
