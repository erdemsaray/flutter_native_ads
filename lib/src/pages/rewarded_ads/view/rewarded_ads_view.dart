import 'package:native_ads/src/core/exports/view_exports.dart';
import '../view_model/rewarded_ads_view_model.dart';

class RewardedAdsView extends StatelessWidget {
  const RewardedAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RewardedAdsViewModel()..loadRewardedAd(),
      child: SmartScaffold(
        title: Text(LocaleKeys.rewarded.tr()),
        body: Consumer<RewardedAdsViewModel>(
          builder: (context, viewModel, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: viewModel.showRewardedAd,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.blue,
                    ),
                    child: Text(LocaleKeys.showRewardedAd.tr()),
                  ),
                  if (viewModel.rewardMessage.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Text(
                        viewModel.rewardMessage,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
