import 'package:native_ads/src/core/exports/view_exports.dart';
import '../view_model/interstitial_ads_view_model.dart';

class InterstitialAdsView extends StatelessWidget {
  const InterstitialAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InterstitialAdsViewModel()..loadInterstitialAd(),
      child: SmartScaffold(
        title: Text(LocaleKeys.interstitial.tr()),
        body: Consumer<InterstitialAdsViewModel>(
          builder: (context, viewModel, child) {
            return Center(
              child: viewModel.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: viewModel.showInterstitialAd,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.blue,
                      ),
                      child: Text(LocaleKeys.showInterstitialAd.tr()),
                    ),
            );
          },
        ),
      ),
    );
  }
}
