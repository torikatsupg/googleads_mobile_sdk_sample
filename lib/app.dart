import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:googleads_mobile_sdk_sample/pages/banner_page.dart';
import 'package:googleads_mobile_sdk_sample/pages/interstial_page.dart';
import 'package:googleads_mobile_sdk_sample/pages/native_page.dart';
import 'package:googleads_mobile_sdk_sample/pages/rewarded_page.dart';
import 'package:riverpod/riverpod.dart';

class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final index = watch(pageProvider.state);
    final pages = _buildPages();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Googleads mobile SDK sample"),
        ),
        body: IndexedStack(
          children: pages,
          index: index,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: _buildBottomNavigationBarItem(),
          onTap: context.read(pageProvider).setIndex,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  List<Widget> _buildPages() {
    return <Widget>[
      BannerPage(),
      InterstitialPage(),
      NativePage(),
      RewardedPage(),
    ];
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "banner"),
      BottomNavigationBarItem(icon: Icon(Icons.add), label: "interstitial"),
      BottomNavigationBarItem(icon: Icon(Icons.list), label: "native"),
      BottomNavigationBarItem(icon: Icon(Icons.history), label: "rewarded"),
    ];
  }
}

final pageProvider = StateNotifierProvider((_) => PageController());

class PageController extends StateNotifier {
  PageController() : super(0);

  int get index => this.state;

  void setIndex(int index) {
    this.state = index;
  }
}
