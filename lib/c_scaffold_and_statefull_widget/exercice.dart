import 'package:flutter/material.dart';

/// Create a layout like :
/// AppBar with title "toto"
/// Bottom bar with 2 tabs "Home" and "Settings"
/// Make this tabs selectable
///
/// Learn the StatefulWidgets
///
void main() => runApp(Solution());

class Solution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("toto"),
      ),
      body: Center(
        child: Text("ok"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("ok"),
          ),
        ],
      ),
    );
  }
}