import 'package:native_ads/src/core/exports/view_exports.dart';
import 'package:native_ads/src/pages/native_ads/widgets/native_ad_card.dart';
import 'package:native_ads/src/pages/native_ads/widgets/native_ad_card_square.dart';
import '../view_model/native_ads_view_model.dart';

class NativeAdsView extends StatelessWidget {
  const NativeAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: Text(LocaleKeys.native.tr()),
      body: Consumer<NativeAdsViewModel>(
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (viewModel.isLoaded && viewModel.nativeAd != null)
                  NativeAdCard(
                    nativeAd: viewModel.nativeAd!,
                  ),
                10.verticalSpace,
                if (viewModel.isLoadedWithBackground &&
                    viewModel.nativeAdWithBackground != null)
                  NativeAdCard(
                    nativeAd: viewModel.nativeAdWithBackground!,
                  ),
                10.verticalSpace,
                if (viewModel.isLoadedMedia && viewModel.nativeAdMedia != null)
                  NativeAdCardSquare(
                    nativeAd: viewModel.nativeAdMedia!,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
