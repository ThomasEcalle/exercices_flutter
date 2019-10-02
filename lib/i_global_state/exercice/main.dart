import 'package:flutter/material.dart';

import 'home.dart';

/// Create an application like :
/// * Screen separated in 2 parts
/// * On top, one button showing dialog when clicked
/// * In dialog, retrieve posts with network call and show them
/// * When selecting a post, dialog should close
/// * On bottom of the screen must be shown the last selected post
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
