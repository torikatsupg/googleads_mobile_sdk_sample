import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googleads_mobile_sdk_sample/app.dart';

run() {
  return runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
