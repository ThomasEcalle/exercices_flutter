import 'package:flutter/material.dart';

/// Create a layout like :
/// AppBar with title "toto"
/// Bottom bar with 2 tabs "Home" and "Settings"
/// Handle tab change
class Solution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _index = 0;
  final List<Widget> lists = [
    Center(
      child: Text("first"),
    ),
    Center(
      child: Text("second"),
    )
  ];

  _changeTab(int newIndex) {
    setState(() {
      _index = newIndex;
    });

    print(_index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("toto"),
      ),
      body: lists[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => _changeTab(index),
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}
