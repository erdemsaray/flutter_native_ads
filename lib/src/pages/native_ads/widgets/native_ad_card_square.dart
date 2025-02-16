import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:native_ads/src/core/exports/view_exports.dart';

class NativeAdCardSquare extends StatelessWidget {
  const NativeAdCardSquare({
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
      height: 350.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: AdWidget(ad: nativeAd),
    );
  }
}
