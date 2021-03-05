import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:googleads_mobile_sdk_sample/app.dart';

run() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  return runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
