import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:native_ads/src/core/exports/view_exports.dart';
import '../view_model/banner_ads_view_model.dart';

class BannerAdsView extends StatelessWidget {
  const BannerAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: Text(LocaleKeys.banner.tr()),
      body: Consumer<BannerAdsViewModel>(
        builder: (context, viewModel, child) {
          if (!viewModel.isLoaded) {
            viewModel.loadBannerAd();
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (viewModel.bannerAd != null)
                Container(
                  alignment: Alignment.center,
                  width: viewModel.bannerAd!.size.width.toDouble(),
                  height: viewModel.bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: viewModel.bannerAd!),
                ),
            ],
          );
        },
      ),
    );
  }
}
