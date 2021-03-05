import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: ElevatedButton(
              child: Text('show interstitial ad'),
              onPressed: () => _buildInterstitialAd(),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: ElevatedButton(
              child: Text('show interstitial movie ad'),
              onPressed: () => _buildInterstitialMovieAd(),
            ),
          ),
        ),
      ],
    ));
  }

  void _buildInterstitialAd() {
    final listener = AdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) {
        (ad as InterstitialAd).show();
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
    );

    final interstitialAd = InterstitialAd(
      // interstitial unit id
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      listener: listener,
      request: AdRequest(),
    );
    interstitialAd.load();

    /// This is not work well.
    /// If you show ad, you should use
    /// ```AdListener.onAdLoaded``` instead of ```await interstitialAd.show()```.
    /// ```
    /// await interstitialAd.load();
    /// await interstitialAd.show();
    /// ```
  }

  void _buildInterstitialMovieAd() {
    final listener = AdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) {
        /// You must cast Ad to something you want.
        (ad as InterstitialAd).show();
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
    );

    final interstitialAd = InterstitialAd(
      // movie interstitial unit id
      adUnitId: 'ca-app-pub-3940256099942544/8691691433',
      listener: listener,
      request: AdRequest(),
    );
    interstitialAd.load();

    /// This is not work well.
    /// If you show ad, you should use
    /// ```AdListener.onAdLoaded``` instead of ```await interstitialAd.show()```.
    /// ```
    /// await interstitialAd.load();
    /// await interstitialAd.show();
    /// ```
  }
}
