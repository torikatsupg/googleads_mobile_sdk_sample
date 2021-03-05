import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                child: Text('rewarded ad'),
                onPressed: () => _showRewardedAd(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                child: Text('rewarded interstitial ad'),
                onPressed: () => _showRewardedAd(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRewardedAd() {
    final listener = AdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) {
        (ad as RewardedAd).show();
      },
      // Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print('Ad failed to load: $error');
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) => print('Ad opened.'),
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) => print('Ad closed.'),
      // Called when an ad is in the process of leaving the application.
      onApplicationExit: (Ad ad) => print('Left application.'),
      // Called when a RewardedAd triggers a reward.
      onRewardedAdUserEarnedReward: (RewardedAd ad, RewardItem reward) {
        print('Reward earned: $reward');
      },
    );
    RewardedAd(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      listener: listener,
      request: AdRequest(),
    )..load();
  }

  void _showRewardedInterstitialAd() {
    final listener = AdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) {
        (ad as RewardedAd).show();
      },
      // Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print('Ad failed to load: $error');
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) => print('Ad opened.'),
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) => print('Ad closed.'),
      // Called when an ad is in the process of leaving the application.
      onApplicationExit: (Ad ad) => print('Left application.'),
      // Called when a RewardedAd triggers a reward.
      onRewardedAdUserEarnedReward: (RewardedAd ad, RewardItem reward) {
        print('Reward earned: $reward');
      },
    );
    RewardedAd(
      adUnitId: 'ca-app-pub-3940256099942544/5354046379',
      listener: listener,
      request: AdRequest(),
    )..load();
  }
}
