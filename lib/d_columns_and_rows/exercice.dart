import 'package:flutter/material.dart';

/// Create a layout like :
/// Half top of the screen represents 2 vertically squares (Yellow and Blue)
/// Half bottom of the screen represents 2 horizontally squares (Purple and Green)
/// The Blue Container must be twice large as Yellow and have two text on center (column based)
///
/// Talk about :
/// * Columns and Rows with Text or Button
/// * Containers and sizes
/// * Columns and Rows with Containers and space issue
/// * Flex
///
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
    return Scaffold(
      body: Container(),
    );
  }
}
