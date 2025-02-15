import 'package:native_ads/src/core/exports/view_exports.dart';
import 'package:native_ads/src/pages/native_ads/widgets/native_ad_card.dart';
import '../view_model/native_ads_view_model.dart';

class NativeAdsView extends StatelessWidget {
  const NativeAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      title: Text(LocaleKeys.native.tr()),
      body: Consumer<NativeAdsViewModel>(
        builder: (context, viewModel, child) {
          if (!viewModel.isLoaded) {
            viewModel.loadNativeAd();
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (viewModel.nativeAd != null)
                NativeAdCard(
                  nativeAd: viewModel.nativeAd!,
                ),
            ],
          );
        },
      ),
    );
  }
}
