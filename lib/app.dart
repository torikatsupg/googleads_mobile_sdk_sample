import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      Center(child: Text("1")),
      Center(child: Text("2")),
      Center(child: Text("3")),
      Center(child: Text("4")),
      Center(child: Text("5")),
    ];
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
      BottomNavigationBarItem(icon: Icon(Icons.list), label: "list"),
      BottomNavigationBarItem(icon: Icon(Icons.history), label: "history"),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "settings"),
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
