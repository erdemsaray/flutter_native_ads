import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:native_ads/src/core/exports/view_exports.dart';

class NativeAdCard extends StatelessWidget {
  const NativeAdCard({
    super.key,
    this.image,
    required this.nativeAd,
  });

  final ImageProvider? image;
  final NativeAd nativeAd;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 135.h,
      decoration: BoxDecoration(
        color: ColorConstants.green,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: AdWidget(ad: nativeAd),
    );
  }
}
