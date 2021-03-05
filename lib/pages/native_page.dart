import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: _buildNativeAd(),
        width: 500,
        height: 500,
      ),
    );
  }

  Widget _buildNativeAd() {
    final listener = AdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) => print('Ad loaded.'),
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
      // Called when a click is recorded for a NativeAd.
      onNativeAdClicked: (NativeAd ad) => print('Ad clicked.'),
      // Called when an impression is recorded for a NativeAd.
      onNativeAdImpression: (NativeAd ad) => print('Ad impression.'),
    );
    final myNative = NativeAd(
      adUnitId: 'ca-app-pub-3940256099942544/2247696110',
      factoryId: 'adFactoryExample',
      request: AdRequest(),
      listener: listener,
    );
    myNative.load();
    return AdWidget(ad: myNative);
  }
}
