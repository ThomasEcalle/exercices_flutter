import 'package:flutter/material.dart';

/// Create a layout like :
/// a Centered Text styled using  theme
class Solution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: TextTheme(
          display1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "Yohoho",
          style: Theme.of(context).textTheme.display1,
        ),
      ),
    );
  }
}