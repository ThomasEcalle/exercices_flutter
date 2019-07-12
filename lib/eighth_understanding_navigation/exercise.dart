import 'package:flutter/material.dart';

/// Create an application :
/// With Screen A B C D
/// A can go to B without params -> simple PUSH
/// A can go to C without params -> PUSH NAMED
/// A can go to D with params -> PUSH NAMED WITH PARAMS
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
      body: Container(),
    );
  }
}
