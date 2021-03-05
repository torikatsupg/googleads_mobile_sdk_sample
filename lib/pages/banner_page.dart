import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildAdsList(),
        Container(
          child: _buildBannerAd(),
          alignment: Alignment.topCenter,
        ),
        Container(
          child: _buildBannerAd(),
          alignment: Alignment.bottomCenter,
        )
      ],
    );
  }

  Widget _buildAdsList() {
    const itemCount = 100;
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index % 10 == 0) {
          return _buildBannerAd();
        } else {
          return ListTile(
            title: Text("list tile"),
          );
        }
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: itemCount,
    );
  }

  Widget _buildBannerAd() {
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
    );

    final myBanner = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: listener,
      request: AdRequest(),
    )..load();

    return Container(
      alignment: Alignment.center,
      child: AdWidget(ad: myBanner),
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );
  }
}
