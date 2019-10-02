import 'package:flutter/material.dart';

/// Create a layout like :
/// A list of data
/// Talsk about :
/// * ListViews
/// * ListTile

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
