import 'package:flutter/material.dart';

/**********************************
 *
 *        PARLER DES RACCOURCIS STLESS ET STFULL
 *
 */

/// Create a layout like :
/// Half top of the screen represents 2 vertically squares (Yellow and Blue)
/// Half bottom of the screen represents 2 horizontally squares (Purple and Green)
/// The Blue Container must be twice large as Yellow and have two text on center (column based)
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
